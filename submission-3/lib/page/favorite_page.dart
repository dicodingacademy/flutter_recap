
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recap/model/detail_page_argument.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/provider/database_notifier.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<DatabaseNotifier>().getDogBreed(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseNotifier>(
      builder: (context, value, child) {
        switch (value.state) {
          case LoadingState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case LoadingState.loaded:
            final list = value.listDogBreed;
            if (list.isEmpty) {
              return const Center(
                child: Text("Empty List"),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: value.listDogBreed.length,
                itemBuilder: (_, index) {
                  final item = value.listDogBreed[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailPage.route,
                        arguments: DetailPageArgument(
                          breed: item.breed,
                          image: item.message,
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: item.message,
                      progressIndicatorBuilder: (_, __, downloadProgress) {
                        return CircularProgressIndicator(
                          value: downloadProgress.progress,
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                  );
                },
              );
            }
          case LoadingState.noData:
            return Center(
              child: Text(value.message),
            );
          default:
            return const Center(
              child: Text("Error"),
            );
        }
      },
    );
  }
}
