---
name: flutter-api-request-flow
description: The mandatory step-by-step flow for implementing any API/network request in a Flutter clean-architecture feature - remote data source, freezed response model, domain entity mapped from the model, repository (abstract contract plus implementation calling the data source), use case calling the repository, and a cubit calling the use case. Use this skill whenever the user asks to add, create, call, fetch, post, submit or integrate an API request, endpoint, HTTP call, backend service, login, list, details, or any remote data in a Flutter app, even if they only say "get the products" or "connect this screen to the API".
---

# Flutter API Request Flow

Every request, GET, POST, PUT, DELETE, goes through **all six steps, in this order**. Never call the network from a cubit, page or repository directly, and never skip a layer.

```
Cubit -> UseCase -> Repository (contract in domain, impl in data) -> RemoteDataSource -> ApiClient (core/network)
```

Files live inside the feature (see `flutter-clean-feature-architecture`):

```
lib/features/FEATURE/
├── data/
│   ├── datasources/   feature_remote_datasource.dart       (abstract)
│   │                  feature_remote_datasource_impl.dart  (implementation)
│   ├── models/        thing_model.dart (+ generated .freezed.dart / .g.dart)
│   └── repositories/  feature_repository_impl.dart
├── domain/
│   ├── entities/      thing_entity.dart
│   ├── repositories/  feature_repository.dart   (abstract)
│   └── usecases/      get_things_usecase.dart
└── presentation/
    └── state/         things_cubit.dart, things_state.dart
```

## Dependencies (add once if missing)

```bash
flutter pub add freezed_annotation json_annotation flutter_bloc fpdart
flutter pub add --dev freezed json_serializable build_runner
```

Also expect `dio` (or the project's HTTP client) wrapped in `lib/core/network/`, plus `get_it` in `core/di/`. Don't add a second HTTP client if one exists. Check pub.dev for current freezed syntax if unsure, since versions differ (freezed 3 needs `abstract class` / `sealed class`). If the project already uses `dartz` for `Either`, use that instead of `fpdart`.

## The six steps

### 1. Data source: add the request
In `data/datasources/`, as **two separate files**: the abstract class in one file and its implementation in another. Never put both in the same file.

The implementation only talks to `ApiClient`, returns **models**, and throws exceptions from `core/errors/` on failure. No business logic, no entities.

`products_remote_datasource.dart` (abstract):
```dart
import '../models/product_model.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}
```

`products_remote_datasource_impl.dart` (implementation):
```dart
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/product_model.dart';
import 'products_remote_datasource.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  const ProductsRemoteDataSourceImpl(this._client);
  final ApiClient _client;

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _client.get(ApiEndpoints.products);
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
```
Naming: abstract file `NAME_remote_datasource.dart` (or `NAME_local_datasource.dart`), implementation file `NAME_remote_datasource_impl.dart`. Each new request adds a method to both files. Everything else (repository, use case) depends on the abstract file only, and DI registers the abstract type with the impl. Put endpoint path constants in `core/network/` (e.g. `api_endpoints.dart`), not inline strings.

### 2. Model: response with freezed
In `data/models/`. A `@freezed` class with `fromJson`. Include the private constructor so it can have the mapper method from step 3.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required int id,
    required String title,
    @JsonKey(name: 'unit_price') required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(id: id, title: title, price: price);
}
```
Use `@JsonKey` for snake_case keys, and nullable types/defaults for optional fields. Request bodies also get a freezed model with `toJson`.

### 3. Entity: used with the model
In `domain/entities/`. Pure Dart (no Flutter, no JSON, no freezed required). It is what the rest of the app sees; **models never leave the data layer**. The model maps to it with `toEntity()`.

```dart
class ProductEntity {
  const ProductEntity({required this.id, required this.title, required this.price});
  final int id;
  final String title;
  final double price;
}
```
Add value equality (`equatable` or freezed) if the project already uses it, so state comparisons work.

### 4. Repository: calls the data source
Contract in `domain/repositories/` (abstract, returns entities), implementation in `data/repositories/` (calls the data source, maps models to entities, converts exceptions into `Failure`s from `core/errors/`).

```dart
// domain
abstract interface class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}

// data
class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl(this._remote);
  final ProductsRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final models = await _remote.getProducts();
      return Right(models.map((m) => m.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
```

### 5. Use case: calls the repository
In `domain/usecases/`. One class per action, one `call` method, depends only on the repository contract.

```dart
class GetProductsUseCase {
  const GetProductsUseCase(this._repository);
  final ProductsRepository _repository;

  Future<Either<Failure, List<ProductEntity>>> call() => _repository.getProducts();
}
```
Requests with parameters take a params object or named arguments.

### 6. Cubit: calls the use case
In `presentation/state/`. State is a freezed union; the cubit depends only on the use case, never on the repository or data source.

```dart
@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.success(List<ProductEntity> products) = _Success;
  const factory ProductsState.failure(String message) = _Failure;
}

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProducts) : super(const ProductsState.initial());
  final GetProductsUseCase _getProducts;

  Future<void> fetchProducts() async {
    emit(const ProductsState.loading());
    final result = await _getProducts();
    result.fold(
      (failure) => emit(ProductsState.failure(failure.message)),
      (products) => emit(ProductsState.success(products)),
    );
  }
}
```
Guard against emitting after `close()` if the cubit can be closed mid-request (`if (isClosed) return;`).

## After the six steps

1. **Register in DI** (`core/di/`): data source -> repository (as the abstract type) -> use case -> cubit (factory).
2. **Provide the cubit** with `BlocProvider` at the page and consume it with `BlocBuilder`/`BlocListener` in widget classes (follow `flutter-widget-rules` if present: no function widgets, one widget per file).
3. **Generate code**: `dart run build_runner build --delete-conflicting-outputs`. Run it before finishing; if it can't run, tell the user to.
4. **Report** which files you created, one line each, in layer order.

