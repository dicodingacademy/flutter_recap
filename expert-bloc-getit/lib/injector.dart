import 'package:flutter_recap/bloc/detail/bloc/detail_bloc.dart';
import 'package:flutter_recap/bloc/favorite/bloc/database_bloc.dart';
import 'package:flutter_recap/bloc/home/bloc/home_bloc.dart';
import 'package:flutter_recap/bloc/home/cubit/home_index_cubit.dart';
import 'package:flutter_recap/service/api_service.dart';
import 'package:flutter_recap/service/database_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory<ApiService>(
    () => ApiService(),
  );
  getIt.registerFactory<DatabaseService>(
    () => DatabaseService(),
  );

  getIt.registerFactory<DatabaseBloc>(
    () => DatabaseBloc(
      databaseService: getIt(),
    ),
  );
  getIt.registerFactory<DetailBloc>(
    () => DetailBloc(
      apiService: getIt(),
    ),
  );
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      apiService: getIt(),
    ),
  );
  getIt.registerFactory<HomeIndexCubit>(
    () => HomeIndexCubit(),
  );
}
