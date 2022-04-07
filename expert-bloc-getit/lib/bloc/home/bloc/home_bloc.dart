import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recap/model/failure_exception.dart';
import 'package:flutter_recap/service/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({
    required this.apiService,
  }) : super(HomeInitial()) {
    on<LoadListDogBreed>((event, emit) async {
      try {
        emit(
          HomeLoading(),
        );
        final result = await apiService.listDogBreed();

        if (result.status == "success") {
          emit(
            HomeLoaded(result.message.keys.toList(), result.status),
          );
        } else {
          emit(
            HomeNoData(result.status),
          );
        }
      } on FailureException catch (e) {
        emit(
          HomeError(e.message),
        );
      }
    });
  }
}
