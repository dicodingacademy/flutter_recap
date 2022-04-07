import 'package:flutter/material.dart';
import 'package:flutter_recap/model/dog_breed_detail.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/service/database_service.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService databaseService;

  DatabaseNotifier({
    required this.databaseService,
  }) {
    getDogBreed();
  }

  LoadingState _state = LoadingState.initial;
  String _message = "";
  List<DogBreedDetail> _listDogBreed = [];

  LoadingState get state => _state;
  String get message => _message;
  List<DogBreedDetail> get listDogBreed => _listDogBreed;

  void getDogBreed() async {
    _state = LoadingState.loading;
    notifyListeners();
    _listDogBreed = await databaseService.getDogBreed();
    if (_listDogBreed.isNotEmpty) {
      _state = LoadingState.loaded;
    } else {
      _state = LoadingState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addDogBreed(DogBreedDetail breed) async {
    try {
      await databaseService.insertDogBreed(breed);
      getDogBreed();
    } catch (e) {
      _state = LoadingState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isBookmark(DogBreedDetail breed) async {
    final bookmarkedArticle = await databaseService.getDogBreedByDetail(breed);
    return bookmarkedArticle;
  }

  void removeDogBreed(DogBreedDetail breed) async {
    try {
      await databaseService.removeDogBreed(breed);
      getDogBreed();
    } catch (e) {
      _state = LoadingState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
