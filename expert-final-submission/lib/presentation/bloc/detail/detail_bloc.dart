import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recap/domain/usecase/detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailUsecase usecase;

  DetailBloc({
    required this.usecase,
  }) : super(DetailInitial()) {
    on<DetailDogBreed>((event, emit) async {
      emit(
        DetailLoading(),
      );
      final breed = event.breed;
      final result = await usecase.getDogBreed(breed);
      result.fold(
        (failure) => emit(
          DetailError(failure.message),
        ),
        (success) {
          if (success.status == "success") {
            emit(
              DetailLoaded(success.message, success.status),
            );
          } else {
            emit(
              DetailNoData(success.status),
            );
          }
        },
      );
    });
  }
}
