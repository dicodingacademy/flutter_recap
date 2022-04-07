import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recap/bloc/detail/bloc/detail_bloc.dart';
import 'package:flutter_recap/bloc/favorite/bloc/database_bloc.dart';
import 'package:flutter_recap/utils/utils.dart';

import 'package:flutter_recap/model/dog_breed_detail.dart';

class DetailPageArgument {
  final String breed;
  final String? image;

  DetailPageArgument({
    required this.breed,
    this.image,
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

class _DetailPageState extends State<DetailPage> with RouteAware {
  @override
  void initState() {
    Future.microtask(() {
      context.read<DetailBloc>().add(
            DetailDogBreed(widget.argument.breed),
          );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void didPop() {
    /// when this page is pop, this code will triggered to run
    Future.microtask(() {
      context.read<DatabaseBloc>().add(
            const GetDogBreed(),
          );
    });
    super.didPop();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jenis Anjing ${widget.argument.breed}"),
        actions: [
          BlocConsumer<DetailBloc, DetailState>(
            listener: (context, detailState) {
              if (detailState is DetailLoaded) {
                final dogBreed = DogBreedDetail(
                  message: widget.argument.image ??
                      (context.read<DetailBloc>().state as DetailLoaded).image,
                  breed: widget.argument.breed,
                  status: "",
                );

                context.read<DatabaseBloc>().add(IsBookmark(dogBreed));
              }
            },
            builder: (context, detailState) {
              return BlocBuilder<DatabaseBloc, DatabaseState>(
                builder: (context, databaseState) {
                  final dogBreed = DogBreedDetail(
                    message: widget.argument.image ??
                        (detailState is DetailLoaded ? detailState.image : ""),
                    breed: widget.argument.breed,
                    status: "",
                  );

                  final isBookmarked = (context.watch<DatabaseBloc>().state
                          is DatabaseIsBookmark)
                      ? (context.read<DatabaseBloc>().state
                              as DatabaseIsBookmark)
                          .isBookmark
                      : false;

                  return IconButton(
                    onPressed: () {
                      if (isBookmarked) {
                        context
                            .read<DatabaseBloc>()
                            .add(RemoveDogBreed(dogBreed));
                      } else {
                        context.read<DatabaseBloc>().add(AddDogBreed(dogBreed));
                      }
                    },
                    icon: Icon(
                        isBookmarked ? Icons.favorite : Icons.favorite_border),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailLoaded) {
            final src = state.image;
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
          } else if (state is DetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}
