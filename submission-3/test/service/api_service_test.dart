import 'dart:io';

import 'package:flutter_recap/model/dog_breed.dart';
import 'package:flutter_recap/model/dog_breed_detail.dart';
import 'package:flutter_recap/model/failure_exception.dart';
import 'package:flutter_recap/service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../utils/json_reader.dart';
import '../utils/test_helper.mocks.dart';

void main() {
  late ApiService apiService;
  late MockHttpClient mockHttpClient;
  late DogBreed dogBreed;
  late DogBreedDetail dogBreedDetail;
  const String breed = "akita";

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiService = ApiService(
      client: mockHttpClient,
    );
    dogBreed = DogBreed.fromRawJson(readJson("dummy/dog_breed.json"));
    dogBreedDetail = DogBreedDetail.fromRawJson(readJson("dummy/${breed}_dog_breed.json"));
  });

  group("API listDogBreed()", () {
    test("should return list of dog's breed when the response code is 200",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breeds/list/all"),
      )).thenAnswer(
          (_) async => http.Response(readJson("dummy/dog_breed.json"), 200));

      // act
      final result = await apiService.listDogBreed();

      // assert
      expect(result, equals(dogBreed));
    });

    test(
        "should return a FailureException when the response code is anything other than 200",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breeds/list/all"),
      )).thenAnswer((_) async => http.Response('Error', 404));

      // act
      final result = apiService.listDogBreed();

      // assert
      expect(result, throwsA(isA<FailureException>()));
    });

    test("should return a FailureException when the response SocketException",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breeds/list/all"),
      )).thenThrow(const SocketException("message"));
      // act
      final result = apiService.listDogBreed();

      // assert
      expect(result, throwsA(isA<FailureException>()));
    });

    test("should return a FailureException when the response Exception",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breeds/list/all"),
      )).thenThrow(Exception());
      // act
      final result = apiService.listDogBreed();

      // assert
      expect(result, throwsA(isA<FailureException>()));
    });
  });
   group("API dogBreed()", () {
    test("should return akita dog's breed when the response code is 200",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      )).thenAnswer(
          (_) async => http.Response(readJson("dummy/${breed}_dog_breed.json"), 200));

      // act
      final result = await apiService.dogBreed(breed);

      // assert
      expect(result, equals(dogBreedDetail));
    });

    test(
        "should return a FailureException when the response code is anything other than 200",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      )).thenAnswer((_) async => http.Response('Error', 404));

      // act
      final result = apiService.dogBreed(breed);

      // assert
      expect(result, throwsA(isA<FailureException>()));
    });

    test("should return a FailureException when the response SocketException",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      )).thenThrow(const SocketException("message"));
      // act
      final result = apiService.dogBreed(breed);

      // assert
      expect(result, throwsA(isA<FailureException>()));
    });

    test("should return a FailureException when the response Exception",
        () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      )).thenThrow(Exception());
      // act
      final result = apiService.dogBreed(breed);

      // assert
      expect(result, throwsA(isA<FailureException>()));
    });
  });
}
