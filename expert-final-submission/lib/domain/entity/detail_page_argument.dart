import 'package:equatable/equatable.dart';

class DetailPageArgument extends Equatable {
  final String breed;
  final String? image;

  const DetailPageArgument({
    required this.breed,
    this.image,
  });

  @override
  List<Object?> get props => [breed, image];
}
