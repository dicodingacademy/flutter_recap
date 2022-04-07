import 'package:flutter/material.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/provider/home_notifier.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static String route = "/";
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<HomeNotifier>().loadListDogBreed(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jenis Anjing"),
      ),
      body: Consumer<HomeNotifier>(
        builder: (context, value, child) {
          switch (value.state) {
            case LoadingState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LoadingState.loaded:
              return ListView.builder(
                itemCount: value.listDogBreed.length,
                itemBuilder: (context, index) {
                  final item = value.listDogBreed[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(item),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailPage.route,
                        arguments: DetailPageArgument(breed: item),
                      );
                    },
                  );
                },
              );
            case LoadingState.error:
              return Center(
                child: Text(value.message),
              );
            default:
              return const Text("");
          }
        },
      ),
    );
  }
}
