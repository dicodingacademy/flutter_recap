import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';

class DogBreedDetailModel extends Equatable {
  const DogBreedDetailModel({
    required this.message,
    required this.breed,
    required this.status,
  });

  final String message;
  final String breed;
  final String status;

  factory DogBreedDetailModel.fromRawJson(String str) =>
      DogBreedDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogBreedDetailModel.fromJson(Map<String, dynamic> json) =>
      DogBreedDetailModel(
        message: json["message"],
        breed: json["breed"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "breed": breed,
        "status": status,
      };

  DogBreedDetail toEntity() => DogBreedDetail(
        message: message,
        breed: breed,
        status: status,
      );

  factory DogBreedDetailModel.fromEntity(DogBreedDetail dogBreed) =>
      DogBreedDetailModel(
        message: dogBreed.message,
        breed: dogBreed.breed,
        status: dogBreed.status,
      );

  @override
  List<Object?> get props => [message, breed, status];
}
