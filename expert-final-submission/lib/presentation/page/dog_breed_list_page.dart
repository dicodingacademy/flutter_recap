import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recap/domain/entity/detail_page_argument.dart';
import 'package:flutter_recap/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_recap/utils/routes/route_helper.dart';

class DogBreedListPage extends StatefulWidget {
  const DogBreedListPage({Key? key}) : super(key: key);

  @override
  State<DogBreedListPage> createState() => _DogBreedListPageState();
}

class _DogBreedListPageState extends State<DogBreedListPage> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<HomeBloc>().add(const LoadListDogBreed()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoaded) {
          return ListView.builder(
            itemCount: state.listDogBreed.length,
            itemBuilder: (context, index) {
              final item = state.listDogBreed[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(item),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    detailRoute,
                    arguments: DetailPageArgument(breed: item),
                  );
                },
              );
            },
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Text("");
        }
      },
    );
  }
}
