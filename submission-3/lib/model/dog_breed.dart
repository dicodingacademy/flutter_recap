import 'dart:convert';

import 'package:equatable/equatable.dart';

class DogBreed extends Equatable {
  const DogBreed({
    required this.message,
    required this.status,
  });

  final Map<String, List<String>> message;
  final String status;

  factory DogBreed.fromRawJson(String str) =>
      DogBreed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogBreed.fromJson(Map<String, dynamic> json) => DogBreed(
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

  @override
  List<Object?> get props => [message, status];
}
