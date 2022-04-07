import 'package:dartz/dartz.dart';
import 'package:flutter_recap/data/helper/failure_exception.dart';
import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';
import 'package:flutter_recap/domain/repository/breed_repository.dart';

class FavoriteUsecase{
  final BreedRepository repository;

  FavoriteUsecase(this.repository);

  Future<Either<FailureException, List<DogBreedDetail>>> getLocalDogBreed(){
    return repository.getLocalDogBreed();
  }
  
  Future<Either<FailureException, bool>> getLocalDogBreedByDetail(
      DogBreedDetail breed) {
    return repository.getLocalDogBreedByDetail(breed);
  }

  Future<Either<FailureException, int>> insertLocalDogBreed(
      DogBreedDetail breed) {
    return repository.insertLocalDogBreed(breed);
  }

  Future<Either<FailureException, int>> removeLocalDogBreed(
      DogBreedDetail breed) {
    return repository.removeLocalDogBreed(breed);
  }
}