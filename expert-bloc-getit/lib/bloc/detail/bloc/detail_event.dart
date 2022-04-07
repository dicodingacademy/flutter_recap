part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailDogBreed extends DetailEvent {
  final String breed;

  const DetailDogBreed(this.breed);

  @override
  List<Object> get props => [breed];
}
