import 'package:flutter_recap/data/model/dog_breed_detail_model.dart';
import 'package:flutter_recap/data/model/dog_breed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/io_client.dart';

class ApiService {
  final http.Client httpClient;
  final IOClient? ioClient;
  late final http.Client client;

  ApiService({
    required this.httpClient,
    this.ioClient,
  }) : client = ioClient ?? httpClient;

  Future<DogBreedModel> listDogBreed() async {
    final response = await client.get(
      Uri.parse("https://dog.ceo/api/breeds/list/all"),
    );
    return DogBreedModel.fromJson(json.decode(response.body));
  }

  Future<DogBreedDetailModel> dogBreed(String breed) async {
    final response = await client.get(
      Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
    );
    return DogBreedDetailModel.fromJson(json.decode(response.body));
  }
}
