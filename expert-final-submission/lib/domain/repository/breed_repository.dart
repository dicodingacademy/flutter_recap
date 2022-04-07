import 'package:dartz/dartz.dart';
import 'package:flutter_recap/data/helper/failure_exception.dart';
import 'package:flutter_recap/domain/entity/dog_breed.dart';
import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';

abstract class BreedRepository{
  /// remote
  Future<Either<FailureException, DogBreed>> getListDogBreed();
  Future<Either<FailureException, DogBreedDetail>> getDogBreed(String breed);

  /// local
  Future<Either<FailureException, List<DogBreedDetail>>> getLocalDogBreed();
  Future<Either<FailureException, bool>> getLocalDogBreedByDetail(DogBreedDetail breed);
  Future<Either<FailureException, int>> insertLocalDogBreed(DogBreedDetail breed);
  Future<Either<FailureException, int>> removeLocalDogBreed(DogBreedDetail breed);
}