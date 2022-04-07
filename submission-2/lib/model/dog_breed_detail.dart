// To parse this JSON data, do
//
//     final dogBreedDetail = dogBreedDetailFromJson(jsonString);

import 'dart:convert';

class DogBreedDetail {
  DogBreedDetail({
    required this.message,
    required this.breed,
    required this.status,
  });

  String message;
  String breed;
  String status;

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
}
