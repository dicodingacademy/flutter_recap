import 'package:flutter_recap/data/model/dog_breed_detail_model.dart';
import 'package:flutter_recap/data/model/dog_breed_model.dart';
import 'package:flutter_recap/data/service/api_service.dart';

abstract class BreedRemoteDataSource {
  Future<DogBreedModel> getListDogBreed();
  Future<DogBreedDetailModel> getDogBreed(String breed);
}

class BreedRemoteDataSourceImpl implements BreedRemoteDataSource {
  final ApiService apiService;

  BreedRemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<DogBreedDetailModel> getDogBreed(String breed) async {
    final response = await apiService.dogBreed(breed);
    return response;
  }

  @override
  Future<DogBreedModel> getListDogBreed() async {
    final response = await apiService.listDogBreed();
    return response;
  }
}
