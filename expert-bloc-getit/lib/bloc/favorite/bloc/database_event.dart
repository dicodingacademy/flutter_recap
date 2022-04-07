part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class GetDogBreed extends DatabaseEvent{
  const GetDogBreed();
}

class AddDogBreed extends DatabaseEvent{
  final DogBreedDetail breed;

  const AddDogBreed(this.breed);

  @override
  List<Object> get props => [breed];
}

class IsBookmark extends DatabaseEvent{
  final DogBreedDetail breed;

  const IsBookmark(this.breed);

  @override
  List<Object> get props => [breed];
}

class RemoveDogBreed extends DatabaseEvent{
  final DogBreedDetail breed;

  const RemoveDogBreed(this.breed);

  @override
  List<Object> get props => [breed];
}
