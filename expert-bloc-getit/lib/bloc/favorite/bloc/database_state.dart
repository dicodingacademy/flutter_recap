part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseLoaded extends DatabaseState {
  final List<DogBreedDetail> listDogBreed;

  const DatabaseLoaded(this.listDogBreed);

  @override
  List<Object> get props => [listDogBreed];
}

class DatabaseNoData extends DatabaseState {
  final String message;

  const DatabaseNoData(this.message);

  @override
  List<Object> get props => [message];
}

class DatabaseError extends DatabaseState {
  final String message;

  const DatabaseError(this.message);

  @override
  List<Object> get props => [message];
}

class DatabaseIsBookmark extends DatabaseState {
  final bool isBookmark;

  const DatabaseIsBookmark(this.isBookmark);

  @override
  List<Object> get props => [isBookmark];
}
