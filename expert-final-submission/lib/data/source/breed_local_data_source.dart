import 'package:flutter_recap/data/model/dog_breed_detail_model.dart';
import 'package:flutter_recap/data/service/database_service.dart';
// import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';

abstract class BreedLocalDataSource {
  Future<int> insertDogBreed(DogBreedDetailModel breed);
  Future<List<DogBreedDetailModel>> getDogBreed();
  Future<bool> getDogBreedByDetail(DogBreedDetailModel breed);
  Future<int> removeDogBreed(DogBreedDetailModel breed);
}

class BreedLocalDataSourceImpl implements BreedLocalDataSource {
  final DatabaseService databaseService;

  BreedLocalDataSourceImpl(this.databaseService);

  @override
  Future<List<DogBreedDetailModel>> getDogBreed() async {
    final result = await databaseService.getDogBreed();
    return result;
  }

  @override
  Future<bool> getDogBreedByDetail(DogBreedDetailModel breed) async {
    final result = await databaseService.getDogBreedByDetail(breed);
    return result;
  }

  @override
  Future<int> insertDogBreed(DogBreedDetailModel breed) async {
    return await databaseService.insertDogBreed(breed);
  }

  @override
  Future<int> removeDogBreed(DogBreedDetailModel breed) async {
    return await databaseService.removeDogBreed(breed);
  }
}
