import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recap/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_recap/presentation/bloc/favorite/database_bloc.dart';
import 'package:flutter_recap/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_recap/presentation/bloc/home/home_index_cubit.dart';
import 'package:flutter_recap/utils/navigation/navigation_helper.dart';
import 'package:flutter_recap/utils/routes/route_helper.dart';
import 'package:flutter_recap/utils/routes/route_observer_helper.dart';

import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// state navigation (provider and bloc)
      providers: [
        BlocProvider(create: (_) => di.getIt<DatabaseBloc>()),
        BlocProvider(create: (_) => di.getIt<DetailBloc>()),
        BlocProvider(create: (_) => di.getIt<HomeBloc>()),
        BlocProvider(create: (_) => di.getIt<HomeIndexCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        /// navigation and route
        navigatorObservers: [
          routeObserver,
        ],
        initialRoute: homeRoute,
        onGenerateRoute: RouteHelper.generateRoute,
        navigatorKey: NavigationHelper.navigatorKey,
      ),
    );
  }
}
