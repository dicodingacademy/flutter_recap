import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recap/domain/usecase/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase usecase;

  HomeBloc({
    required this.usecase,
  }) : super(HomeInitial()) {
    on<LoadListDogBreed>((event, emit) async {
      emit(
        HomeLoading(),
      );
      final result = await usecase.getListDogBreed();
      result.fold(
        (failure) => emit(
          HomeError(failure.message),
        ),
        (success) {
          if (success.status == "success") {
            emit(
              HomeLoaded(success.message.keys.toList(), success.status),
            );
          } else {
            emit(
              HomeNoData(success.status),
            );
          }
        },
      );
    });
  }
}
