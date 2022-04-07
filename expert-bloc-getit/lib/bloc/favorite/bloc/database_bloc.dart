import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recap/model/dog_breed_detail.dart';
import 'package:flutter_recap/service/database_service.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseService databaseService;
  DatabaseBloc({
    required this.databaseService,
  }) : super(DatabaseInitial()) {
    on<GetDogBreed>((event, emit) async {
      try {
        emit(
          DatabaseLoading(),
        );
        final result = await databaseService.getDogBreed();

        if (result.isNotEmpty) {
          emit(
            DatabaseLoaded(result),
          );
        } else {
          emit(
            const DatabaseNoData("Empty Data"),
          );
        }
      } catch (e) {
        emit(
          DatabaseError(e.toString()),
        );
      }
    });

    on<AddDogBreed>((event, emit) async {
      final breed = event.breed;
      try {
        emit(
          DatabaseLoading(),
        );
        await databaseService.insertDogBreed(breed);
      } catch (e) {
        emit(
          DatabaseError(e.toString()),
        );
      }
      add(IsBookmark(breed));
    });

    on<RemoveDogBreed>((event, emit) async {
      final breed = event.breed;
      try {
        emit(
          DatabaseLoading(),
        );
        await databaseService.removeDogBreed(breed);
      } catch (e) {
        emit(
          DatabaseError(e.toString()),
        );
      }
      add(IsBookmark(breed));
    });

    on<IsBookmark>((event, emit) async {
      try {
        emit(
          DatabaseLoading(),
        );
        final breed = event.breed;
        final result = await databaseService.getDogBreedByDetail(breed);

        emit(
          DatabaseIsBookmark(result),
        );
      } catch (e) {
        emit(
          DatabaseError(e.toString()),
        );
      }
    });
  }
}
