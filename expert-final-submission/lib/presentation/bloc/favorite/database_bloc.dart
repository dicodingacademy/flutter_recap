import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';
import 'package:flutter_recap/domain/usecase/favorite.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final FavoriteUsecase usecase;
  DatabaseBloc({
    required this.usecase,
  }) : super(DatabaseInitial()) {
    on<GetDogBreed>((event, emit) async {
      emit(
        DatabaseLoading(),
      );
      final result = await usecase.getLocalDogBreed();

      result.fold(
        (failure) => emit(
          DatabaseError(failure.message),
        ),
        (success) {
          if (success.isNotEmpty) {
            emit(
              DatabaseLoaded(success),
            );
          } else {
            emit(
              const DatabaseNoData("Empty Data"),
            );
          }
        },
      );
    });

    on<AddDogBreed>((event, emit) async {
      final breed = event.breed;

      emit(
        DatabaseLoading(),
      );
      final result = await usecase.insertLocalDogBreed(breed);

      result.fold(
        (failure) => emit(
          DatabaseError(failure.message),
        ),
        (success) {
          add(IsBookmark(breed));
        },
      );
    });

    on<RemoveDogBreed>((event, emit) async {
      final breed = event.breed;

      emit(
        DatabaseLoading(),
      );
      final result = await usecase.removeLocalDogBreed(breed);

      result.fold(
        (failure) => emit(
          DatabaseError(failure.message),
        ),
        (success) {
          add(IsBookmark(breed));
        },
      );
    });

    on<IsBookmark>((event, emit) async {
      final breed = event.breed;

      emit(
        DatabaseLoading(),
      );
      final result = await usecase.getLocalDogBreedByDetail(breed);

      result.fold(
        (failure) => emit(
          DatabaseError(failure.message),
        ),
        (success) {
          emit(
            DatabaseIsBookmark(success),
          );
        },
      );
    });
  }
}
