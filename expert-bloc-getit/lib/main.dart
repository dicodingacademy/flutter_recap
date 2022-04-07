import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recap/bloc/detail/bloc/detail_bloc.dart';
import 'package:flutter_recap/bloc/favorite/bloc/database_bloc.dart';
import 'package:flutter_recap/bloc/home/bloc/home_bloc.dart';
import 'package:flutter_recap/bloc/home/cubit/home_index_cubit.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/page/home_page.dart';
import 'package:flutter_recap/utils/utils.dart';
import 'injector.dart' as di;

void main() async {
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
        initialRoute: MyHomePage.route,
        routes: {
          MyHomePage.route: (_) => const MyHomePage(),
          DetailPage.route: (context) => DetailPage(
                argument: ModalRoute.of(context)!.settings.arguments
                    as DetailPageArgument,
              ),
        },
      ),
    );
  }
}
