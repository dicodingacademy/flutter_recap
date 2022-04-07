import 'package:equatable/equatable.dart';

class DogBreedDetail extends Equatable {
  const DogBreedDetail({
    required this.message,
    required this.breed,
    required this.status,
  });

  final String message;
  final String breed;
  final String status;

  @override
  List<Object?> get props => [message, breed, status];
}
