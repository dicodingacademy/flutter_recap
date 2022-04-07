import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/provider/detail_notifier.dart';
import 'package:provider/provider.dart';

class DetailPageArgument {
  final String breed;

  DetailPageArgument({
    required this.breed,
  });
}

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
        title:  Text("Jenis Anjing ${widget.argument.breed}"),
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
                  imageUrl: src,
                  progressIndicatorBuilder: (_, __, downloadProgress) {
                    return CircularProgressIndicator(
                      value: downloadProgress.progress,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
                // child: Image.network(src),
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
