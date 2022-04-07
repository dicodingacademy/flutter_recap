import 'dart:io';

import 'package:flutter_recap/model/dog_breed.dart';
import 'package:flutter_recap/model/dog_breed_detail.dart';
import 'package:flutter_recap/model/failure_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<DogBreed> listDogBreed() async {
    try {
      final response = await http.get(
        Uri.parse("https://dog.ceo/api/breeds/list/all"),
      );
      if (response.statusCode == 200) {
        return DogBreed.fromJson(json.decode(response.body));
      } else {
        throw FailureException('Responses are not success');
      }
    } on SocketException {
      throw FailureException('No Internet Connection');
    } catch (e) {
      throw FailureException('Failed to load list of dog breeds');
    }
  }

  Future<DogBreedDetail> dogBreed(String breed) async {
    try {
      final response = await http.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      );
      if (response.statusCode == 200) {
        return DogBreedDetail.fromJson(json.decode(response.body));
      } else {
        throw FailureException('Responses are not success');
      }
    } on SocketException {
      throw FailureException('No Internet Connection');
    } catch (e) {
      throw FailureException('Failed to load image of dog $breed');
    }
  }
}
