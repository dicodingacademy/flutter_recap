import 'package:flutter/material.dart';
import 'package:flutter_recap/page/dog_breed_list_page.dart';
import 'package:flutter_recap/page/favorite_page.dart';
import 'package:flutter_recap/page/setting_page.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Jenis Anjing'),
              onTap: () {
                context.read<HomeNotifier>().setIndexPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Favorite Anjing'),
              onTap: () {
                context.read<HomeNotifier>().setIndexPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                context.read<HomeNotifier>().setIndexPage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Jenis Anjing"),
      ),
      body: IndexedStack(
        index: context.watch<HomeNotifier>().indexPage,
        children: const [
          DogBreedListPage(),
          FavoritePage(),
          SettingPage(),
        ],
      ),
    );
  }
}
