import 'package:flutter_recap/data/repository/breed_repository_impl.dart';
import 'package:flutter_recap/data/service/api_service.dart';
import 'package:flutter_recap/data/service/database_service.dart';
import 'package:flutter_recap/data/source/breed_local_data_source.dart';
import 'package:flutter_recap/data/source/breed_remote_data_source.dart';
import 'package:flutter_recap/domain/repository/breed_repository.dart';
import 'package:flutter_recap/domain/usecase/detail.dart';
import 'package:flutter_recap/domain/usecase/favorite.dart';
import 'package:flutter_recap/domain/usecase/home.dart';
import 'package:flutter_recap/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_recap/presentation/bloc/favorite/database_bloc.dart';
import 'package:flutter_recap/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_recap/presentation/bloc/home/home_index_cubit.dart';
import 'package:flutter_recap/utils/ssl/ssl_pinning.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setup() async {
  IOClient ioClient = await SSLPinning.ioClient;

  // bloc
  getIt.registerFactory<DetailBloc>(() => DetailBloc(
        usecase: getIt(),
      ));
  getIt.registerFactory<DatabaseBloc>(() => DatabaseBloc(
        usecase: getIt(),
      ));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
        usecase: getIt(),
      ));
  getIt.registerFactory<HomeIndexCubit>(() => HomeIndexCubit());

  // usecase
  getIt.registerLazySingleton<DetailUsecase>(() => DetailUsecase(
        getIt(),
      ));
  getIt.registerLazySingleton<FavoriteUsecase>(() => FavoriteUsecase(
        getIt(),
      ));
  getIt.registerLazySingleton<HomeUsecase>(() => HomeUsecase(
        getIt(),
      ));

  // repository (abstract class)
  getIt.registerLazySingleton<BreedRepository>(() => BreedRepositoryImpl(
        remote: getIt(),
        local: getIt(),
      ));

  // source (abstract class)
  getIt.registerLazySingleton<BreedRemoteDataSource>(
      () => BreedRemoteDataSourceImpl(
            getIt(),
          ));
  getIt.registerLazySingleton<BreedLocalDataSource>(
      () => BreedLocalDataSourceImpl(
            getIt(),
          ));

  // service
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
  getIt.registerLazySingleton<ApiService>(() => ApiService(
        httpClient: getIt(),
        ioClient: getIt(),
      ));

  // external
  getIt.registerFactory<IOClient>(() => ioClient);
  getIt.registerFactory<http.Client>(() => http.Client());
}
