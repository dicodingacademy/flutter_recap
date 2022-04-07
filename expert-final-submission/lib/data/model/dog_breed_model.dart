import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_recap/domain/entity/dog_breed.dart';

class DogBreedModel extends Equatable {
  const DogBreedModel({
    required this.message,
    required this.status,
  });

  final Map<String, List<String>> message;
  final String status;

  factory DogBreedModel.fromRawJson(String str) =>
      DogBreedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogBreedModel.fromJson(Map<String, dynamic> json) => DogBreedModel(
        message: Map.from(json["message"]).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": Map.from(message).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };

  DogBreed toEntity() => DogBreed(
        message: message,
        status: status,
      );

  factory DogBreedModel.fromEntity(DogBreed dogBreed) => DogBreedModel(
        message: dogBreed.message,
        status: dogBreed.status,
      );

  @override
  List<Object?> get props => [message, status];
}
