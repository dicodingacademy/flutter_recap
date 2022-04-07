import 'package:dartz/dartz.dart';
import 'package:flutter_recap/data/helper/failure_exception.dart';
import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';
import 'package:flutter_recap/domain/repository/breed_repository.dart';

class DetailUsecase {
  final BreedRepository repository;

  DetailUsecase(this.repository);

  Future<Either<FailureException, DogBreedDetail>> getDogBreed(String breed) {
    return repository.getDogBreed(breed);
  }
}
