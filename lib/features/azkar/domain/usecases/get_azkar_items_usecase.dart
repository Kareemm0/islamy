import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/azkar_item.dart';
import '../repositories/azkar_repository.dart';

class GetAzkarItemsUseCase {
  const GetAzkarItemsUseCase(this._repository);

  final AzkarRepository _repository;

  Future<Either<Failure, List<AzkarItem>>> call() =>
      _repository.getAzkarItems();
}
