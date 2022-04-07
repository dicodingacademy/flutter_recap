import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_recap/model/detail_page_argument.dart';
import 'package:flutter_recap/model/dog_breed_detail.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/provider/database_notifier.dart';
import 'package:flutter_recap/provider/detail_notifier.dart';

class DetailPage extends StatefulWidget {
  static String route = "/detail";
  final DetailPageArgument argument;
  const DetailPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<DetailNotifier>().loadDogBreed(widget.argument.breed),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jenis Anjing ${widget.argument.breed}"),
        actions: [
          Consumer2<DatabaseNotifier, DetailNotifier>(
            builder: (context, database, detail, child) {
              final dogBreed = DogBreedDetail(
                message: widget.argument.image ?? detail.image,
                breed: widget.argument.breed,
                status: "",
              );
              return IconButton(
                onPressed: () async {
                  final isBookmark =
                      await context.read<DatabaseNotifier>().isBookmark(
                            dogBreed,
                          );
                  if (isBookmark) {
                    context.read<DatabaseNotifier>().removeDogBreed(dogBreed);
                  } else {
                    context.read<DatabaseNotifier>().addDogBreed(dogBreed);
                  }
                },
                icon: FutureBuilder<bool>(
                    future: context.read<DatabaseNotifier>().isBookmark(
                          dogBreed,
                        ),
                    builder: (context, snapshot) {
                      var isBookmarked = snapshot.data ?? false;
                      return Icon(isBookmarked
                          ? Icons.favorite
                          : Icons.favorite_border);
                    }),
              );
            },
          ),
        ],
      ),
      body: Consumer<DetailNotifier>(
        builder: (context, value, child) {
          switch (value.state) {
            case LoadingState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LoadingState.loaded:
              final src = value.image;
              return Center(
                child: CachedNetworkImage(
                  imageUrl: widget.argument.image ?? src,
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
