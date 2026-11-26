import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../features/quran/presentation/cubit/bookmark_cubit.dart';

import '../../features/azkar/data/datasources/azkar_remote_datasource.dart';
import '../../features/azkar/data/datasources/azkar_remote_datasource_impl.dart';
import '../../features/azkar/data/repositories/azkar_repository_impl.dart';
import '../../features/azkar/domain/repositories/azkar_repository.dart';
import '../../features/azkar/domain/usecases/get_azkar_items_usecase.dart';
import '../../features/azkar/presentation/cubit/azkar_cubit.dart';
import '../../features/hadith/data/datasources/hadith_local_datasource.dart';
import '../../features/hadith/data/datasources/hadith_remote_datasource.dart';
import '../../features/hadith/data/datasources/hadith_remote_datasource_impl.dart';
import '../../features/hadith/data/repositories/hadith_repository_impl.dart';
import '../../features/hadith/domain/repositories/hadith_repository.dart';
import '../../features/hadith/domain/usecases/get_hadith_books_usecase.dart';
import '../../features/hadith/domain/usecases/get_hadith_collection_page_usecase.dart';
import '../../features/hadith/domain/usecases/get_hadith_of_day_usecase.dart';
import '../../features/hadith/presentation/cubit/hadith_cubit.dart';
import '../../features/hadith/presentation/cubit/hadith_details_cubit.dart';
import '../../features/quran/data/datasources/quran_cache_datasource.dart';
import '../../features/quran/data/datasources/quran_remote_datasource.dart';
import '../../features/quran/data/datasources/quran_remote_datasource_impl.dart';
import '../../features/quran/data/repositories/quran_repository_impl.dart';
import '../../features/quran/domain/repositories/quran_repository.dart';
import '../../features/quran/domain/usecases/get_surah_details_usecase.dart';
import '../../features/quran/domain/usecases/get_surahs_usecase.dart';
import '../../features/quran/presentation/cubit/quran_cubit.dart';
import '../../features/quran/presentation/cubit/surah_details_cubit.dart';
import '../local_storage/local_database.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

/// Registers all core services and feature dependencies in [GetIt].
Future<void> initDependencies() async {
  // Core
  if (!sl.isRegistered<ApiClient>()) {
    sl.registerLazySingleton<ApiClient>(ApiClient.new);
  }

  // Local database
  await LocalDatabase.init();

  if (!sl.isRegistered<BookmarkCubit>()) {
    sl.registerLazySingleton<BookmarkCubit>(
      () => BookmarkCubit(Hive.box<String>(LocalDatabase.quranBox)),
    );
  }

  // Quran - Data sources
  if (!sl.isRegistered<QuranCacheDatasource>()) {
    sl.registerLazySingleton<QuranCacheDatasource>(
      () => QuranCacheDatasource(Hive.box<String>(LocalDatabase.quranBox)),
    );
  }

  if (!sl.isRegistered<QuranRemoteDataSource>()) {
    sl.registerLazySingleton<QuranRemoteDataSource>(
      () => QuranRemoteDataSourceImpl(sl<ApiClient>()),
    );
  }

  // Quran - Repository
  if (!sl.isRegistered<QuranRepository>()) {
    sl.registerLazySingleton<QuranRepository>(
      () => QuranRepositoryImpl(
        sl<QuranRemoteDataSource>(),

        sl<QuranCacheDatasource>(),
      ),
    );
  }

  // Quran - Use cases
  if (!sl.isRegistered<GetSurahsUseCase>()) {
    sl.registerLazySingleton<GetSurahsUseCase>(
      () => GetSurahsUseCase(sl<QuranRepository>()),
    );
  }
  if (!sl.isRegistered<GetSurahDetailsUseCase>()) {
    sl.registerLazySingleton<GetSurahDetailsUseCase>(
      () => GetSurahDetailsUseCase(sl<QuranRepository>()),
    );
  }

  // Quran - Cubits
  if (!sl.isRegistered<QuranCubit>()) {
    sl.registerFactory<QuranCubit>(
      () => QuranCubit(getSurahs: sl<GetSurahsUseCase>()),
    );
  }
  if (!sl.isRegistered<SurahDetailsCubit>()) {
    sl.registerFactory<SurahDetailsCubit>(
      () => SurahDetailsCubit(sl<GetSurahDetailsUseCase>()),
    );
  }

  // Hadith - Data sources
  if (!sl.isRegistered<HadithLocalDataSource>()) {
    sl.registerLazySingleton<HadithLocalDataSource>(
      () => const HadithLocalDataSource(),
    );
  }
  if (!sl.isRegistered<HadithRemoteDataSource>()) {
    sl.registerLazySingleton<HadithRemoteDataSource>(
      () => HadithRemoteDataSourceImpl(sl<ApiClient>()),
    );
  }

  // Hadith - Repository
  if (!sl.isRegistered<HadithRepository>()) {
    sl.registerLazySingleton<HadithRepository>(
      () => HadithRepositoryImpl(
        sl<HadithRemoteDataSource>(),
        sl<HadithLocalDataSource>(),
      ),
    );
  }

  // Hadith - Use cases
  if (!sl.isRegistered<GetHadithBooksUseCase>()) {
    sl.registerLazySingleton<GetHadithBooksUseCase>(
      () => GetHadithBooksUseCase(sl<HadithRepository>()),
    );
  }
  if (!sl.isRegistered<GetHadithCollectionPageUseCase>()) {
    sl.registerLazySingleton<GetHadithCollectionPageUseCase>(
      () => GetHadithCollectionPageUseCase(sl<HadithRepository>()),
    );
  }
  if (!sl.isRegistered<GetHadithOfDayUseCase>()) {
    sl.registerLazySingleton<GetHadithOfDayUseCase>(
      () => GetHadithOfDayUseCase(sl<HadithRepository>()),
    );
  }

  // Hadith - Cubits
  if (!sl.isRegistered<HadithCubit>()) {
    sl.registerFactory<HadithCubit>(
      () => HadithCubit(
        getBooks: sl<GetHadithBooksUseCase>(),
        getHadithOfDay: sl<GetHadithOfDayUseCase>(),
      ),
    );
  }
  if (!sl.isRegistered<HadithDetailsCubit>()) {
    sl.registerFactory<HadithDetailsCubit>(
      () => HadithDetailsCubit(sl<GetHadithCollectionPageUseCase>()),
    );
  }

  // Azkar - Data source
  if (!sl.isRegistered<AzkarRemoteDataSource>()) {
    sl.registerLazySingleton<AzkarRemoteDataSource>(
      () => AzkarRemoteDataSourceImpl(sl<ApiClient>()),
    );
  }

  // Azkar - Repository
  if (!sl.isRegistered<AzkarRepository>()) {
    sl.registerLazySingleton<AzkarRepository>(
      () => AzkarRepositoryImpl(sl<AzkarRemoteDataSource>()),
    );
  }

  // Azkar - Use case
  if (!sl.isRegistered<GetAzkarItemsUseCase>()) {
    sl.registerLazySingleton<GetAzkarItemsUseCase>(
      () => GetAzkarItemsUseCase(sl<AzkarRepository>()),
    );
  }

  // Azkar - Cubit
  if (!sl.isRegistered<AzkarCubit>()) {
    sl.registerFactory<AzkarCubit>(
      () => AzkarCubit(sl<GetAzkarItemsUseCase>()),
    );
  }
}
