import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_recap/data/helper/failure_exception.dart';
import 'package:flutter_recap/data/model/dog_breed_detail_model.dart';
import 'package:flutter_recap/data/source/breed_local_data_source.dart';
import 'package:flutter_recap/data/source/breed_remote_data_source.dart';
import 'package:flutter_recap/domain/entity/dog_breed.dart';
import 'package:flutter_recap/domain/entity/dog_breed_detail.dart';
import 'package:flutter_recap/domain/repository/breed_repository.dart';

class BreedRepositoryImpl extends BreedRepository {
  final BreedRemoteDataSource remote;
  final BreedLocalDataSource local;

  BreedRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<FailureException, DogBreedDetail>> getDogBreed(
      String breed) async {
    try {
      final result = await remote.getDogBreed(breed);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No Internet Connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load list of dog breeds'));
    }
  }

  @override
  Future<Either<FailureException, DogBreed>> getListDogBreed() async {
    try {
      final result = await remote.getListDogBreed();
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No Internet Connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load list of dog breeds'));
    }
  }

  @override
  Future<Either<FailureException, List<DogBreedDetail>>>
      getLocalDogBreed() async {
    try {
      final result = await local.getDogBreed();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DatabaseException {
      return const Left(FailureException("Failed to connect to the database"));
    }
  }

  @override
  Future<Either<FailureException, bool>> getLocalDogBreedByDetail(
      DogBreedDetail breed) async {
    try {
      final result = await local.getDogBreedByDetail(
        DogBreedDetailModel.fromEntity(breed),
      );
      return Right(result);
    } on DatabaseException {
      return const Left(FailureException("Failed to connect to the database"));
    }
  }

  @override
  Future<Either<FailureException, int>> insertLocalDogBreed(
      DogBreedDetail breed) async {
    try {
      final result = await local.insertDogBreed(
        DogBreedDetailModel.fromEntity(breed),
      );
      return Right(result);
    } on DatabaseException {
      return const Left(FailureException("Failed to connect to the database"));
    }
  }

  @override
  Future<Either<FailureException, int>> removeLocalDogBreed(
      DogBreedDetail breed) async {
    try {
      final result = await local.removeDogBreed(
        DogBreedDetailModel.fromEntity(breed),
      );
      return Right(result);
    } on DatabaseException {
      return const Left(FailureException("Failed to connect to the database"));
    }
  }
}
