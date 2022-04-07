
import 'dart:convert';

class DetailPageArgument {
  final String breed;
  final String? image;

  DetailPageArgument({
    required this.breed,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'breed': breed,
      'image': image,
    };
  }

  factory DetailPageArgument.fromMap(Map<String, dynamic> map) {
    return DetailPageArgument(
      breed: map['breed'] ?? '',
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailPageArgument.fromJson(String source) => DetailPageArgument.fromMap(json.decode(source));
}