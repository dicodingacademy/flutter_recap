import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/objects.dart';
import '../../utils/test_helper.mocks.dart';

void main() {
  late MockDatabaseService mockDatabaseService;

  setUp(() {
    mockDatabaseService = MockDatabaseService();
  });

  group("DATABASE", () {
    group("Get All Data", () {
      test("should return list when get all data from database", () async {
        // arrange
        when(mockDatabaseService.getDogBreed())
            .thenAnswer((_) async => testListDogBreedDetail);

        // act
        final result = await mockDatabaseService.getDogBreed();

        // assert
        expect(result, testListDogBreedDetail);
      });
    });

    group("Get One Item", () {
      test("should return true when data is the same as in database", () async {
        // arrange
        when(mockDatabaseService.getDogBreedByDetail(testDogBreedDetail))
            .thenAnswer((_) async => true);

        // act
        final result =
            await mockDatabaseService.getDogBreedByDetail(testDogBreedDetail);

        // assert
        expect(result, true);
      });

      test("should return false when data is not the same as in database",
          () async {
        // arrange
        when(mockDatabaseService.getDogBreedByDetail(testDogBreedDetail))
            .thenAnswer((_) async => false);

        // act
        final result =
            await mockDatabaseService.getDogBreedByDetail(testDogBreedDetail);

        // assert
        expect(result, false);
      });
    });

    group("Insert Data", () {
      test("should return success (1) when insert data is success", () async {
        // arrange
        when(mockDatabaseService.insertDogBreed(testDogBreedDetail))
            .thenAnswer((_) async => 1);

        // act
        final result =
            await mockDatabaseService.insertDogBreed(testDogBreedDetail);

        // assert
        expect(result, 1);
      });

      test("should return fail (0) when insert data is fail", () async {
        // arrange
        when(mockDatabaseService.insertDogBreed(testDogBreedDetail))
            .thenAnswer((_) async => 0);

        // act
        final result =
            await mockDatabaseService.insertDogBreed(testDogBreedDetail);

        // assert
        expect(result, 0);
      });
    });

    group("Remove Data", () {
      test("should return success (1) when remove data is success", () async {
        // arrange
        when(mockDatabaseService.removeDogBreed(testDogBreedDetail))
            .thenAnswer((_) async => 1);

        // act
        final result =
            await mockDatabaseService.removeDogBreed(testDogBreedDetail);

        // assert
        expect(result, 1);
      });

      test("should return fail (0) when remove data is fail", () async {
        // arrange
        when(mockDatabaseService.removeDogBreed(testDogBreedDetail))
            .thenAnswer((_) async => 0);

        // act
        final result =
            await mockDatabaseService.removeDogBreed(testDogBreedDetail);

        // assert
        expect(result, 0);
      });
    });
  });
}
