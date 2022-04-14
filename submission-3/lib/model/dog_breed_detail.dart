// To parse this JSON data, do
//
//     final dogBreedDetail = dogBreedDetailFromJson(jsonString);

import 'dart:convert';

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

  factory DogBreedDetail.fromRawJson(String str) =>
      DogBreedDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogBreedDetail.fromJson(Map<String, dynamic> json) => DogBreedDetail(
        message: json["message"],
        breed: json["breed"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "breed": breed,
        "status": status,
      };

  @override
  List<Object?> get props => [message, breed, status];
}
