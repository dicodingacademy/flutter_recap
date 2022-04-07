import 'package:dartz/dartz.dart';
import 'package:flutter_recap/data/helper/failure_exception.dart';
import 'package:flutter_recap/domain/entity/dog_breed.dart';
import 'package:flutter_recap/domain/repository/breed_repository.dart';

class HomeUsecase {
  final BreedRepository repository;

  HomeUsecase(this.repository);

  Future<Either<FailureException, DogBreed>> getListDogBreed() {
    return repository.getListDogBreed();
  }
}
