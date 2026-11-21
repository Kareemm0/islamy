import 'package:get_it/get_it.dart';

import '../../features/quran/data/datasources/quran_local_datasource.dart';
import '../../features/quran/data/datasources/quran_remote_datasource.dart';
import '../../features/quran/data/datasources/quran_remote_datasource_impl.dart';
import '../../features/quran/data/repositories/quran_repository_impl.dart';
import '../../features/quran/domain/repositories/quran_repository.dart';
import '../../features/quran/domain/usecases/get_quran_bookmarks_usecase.dart';
import '../../features/quran/domain/usecases/get_quran_last_read_usecase.dart';
import '../../features/quran/domain/usecases/get_surah_details_usecase.dart';
import '../../features/quran/domain/usecases/get_surahs_usecase.dart';
import '../../features/quran/presentation/cubit/quran_cubit.dart';
import '../../features/quran/presentation/cubit/surah_details_cubit.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

/// Registers all core services and feature dependencies in [GetIt].
Future<void> initDependencies() async {
  // Core
  if (!sl.isRegistered<ApiClient>()) {
    sl.registerLazySingleton<ApiClient>(ApiClient.new);
  }

  // Quran - Data sources
  if (!sl.isRegistered<QuranLocalDatasource>()) {
    sl.registerLazySingleton<QuranLocalDatasource>(
      () => const QuranLocalDatasource(),
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
        sl<QuranLocalDatasource>(),
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
  if (!sl.isRegistered<GetQuranLastReadUseCase>()) {
    sl.registerLazySingleton<GetQuranLastReadUseCase>(
      () => GetQuranLastReadUseCase(sl<QuranRepository>()),
    );
  }
  if (!sl.isRegistered<GetQuranBookmarksUseCase>()) {
    sl.registerLazySingleton<GetQuranBookmarksUseCase>(
      () => GetQuranBookmarksUseCase(sl<QuranRepository>()),
    );
  }

  // Quran - Cubits
  if (!sl.isRegistered<QuranCubit>()) {
    sl.registerFactory<QuranCubit>(
      () => QuranCubit(
        getSurahs: sl<GetSurahsUseCase>(),
        getLastRead: sl<GetQuranLastReadUseCase>(),
        getBookmarks: sl<GetQuranBookmarksUseCase>(),
      ),
    );
  }
  if (!sl.isRegistered<SurahDetailsCubit>()) {
    sl.registerFactory<SurahDetailsCubit>(
      () => SurahDetailsCubit(sl<GetSurahDetailsUseCase>()),
    );
  }
}
