import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recap/provider/detail_notifier.dart';
import 'package:flutter_recap/provider/home_notifier.dart';

void main() {
  group("Home Notifier", () {
    test('should be 95 length when load list of dog breed ', () async {
      // arrange
      var homeProvider = HomeNotifier();
      var lenghtDogBreed = 95;
      // act
      await homeProvider.loadListDogBreed();
      // assert
      var result = homeProvider.listDogBreed.length;
      expect(result, lenghtDogBreed);
    });

    test('first item should be "affenpinscher" when load list of dog breed ',
        () async {
      // arrange
      var homeProvider = HomeNotifier();
      var testDogBreed = "affenpinscher";
      // act
      await homeProvider.loadListDogBreed();
      // assert
      var result = homeProvider.listDogBreed.first;
      expect(result, testDogBreed);
    });

    test('should return 1 when set the index page', () async {
      // arrange
      var homeProvider = HomeNotifier();
      var testIndexPage = 1;
      // act
      homeProvider.setIndexPage(testIndexPage);
      // assert
      var result = homeProvider.indexPage;
      expect(result, testIndexPage);
    });
  });

  group("Detail Notifier", () {
    test("should success when load the dog's breed", () async {
      // arrange
      var detailProvider = DetailNotifier();
      var testDogBreed = "affenpinscher";
      // act
      await detailProvider.loadDogBreed(testDogBreed);
      // assert
      var result = detailProvider.message;
      expect(result, "success");
    });
  });
}
