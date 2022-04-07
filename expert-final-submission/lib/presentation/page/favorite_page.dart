import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recap/domain/entity/detail_page_argument.dart';
import 'package:flutter_recap/presentation/bloc/favorite/database_bloc.dart';
import 'package:flutter_recap/utils/routes/route_helper.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<DatabaseBloc>().add(const GetDogBreed()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is DatabaseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DatabaseLoaded) {
          final list = state.listDogBreed;
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
              itemCount: state.listDogBreed.length,
              itemBuilder: (_, index) {
                final item = state.listDogBreed[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      detailRoute,
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
        } else if (state is DatabaseNoData) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
