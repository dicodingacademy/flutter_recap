import 'package:flutter/material.dart';
import 'package:flutter_recap/model/failure_exception.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/service/api_service.dart';

class HomeNotifier extends ChangeNotifier {
  LoadingState _state = LoadingState.initial;
  List<String>? _listDogBreed;
  String _message = "";
  int _indexPage = 0;

  LoadingState get state => _state;
  List<String> get listDogBreed => _listDogBreed ?? [];
  String get message => _message;
  int get indexPage => _indexPage;

  void setIndexPage(int index) {
    _indexPage = index;
    notifyListeners();
  }

  Future<dynamic> loadListDogBreed() async {
    try {
      _state = LoadingState.loading;
      notifyListeners();

      final result = await ApiService().listDogBreed();

      if (result.status == "success") {
        _state = LoadingState.loaded;
        _message = result.status;
        _listDogBreed = result.message.keys.toList();

        notifyListeners();
        return _message;
      } else {
        _state = LoadingState.noData;
        _message = result.status;
        notifyListeners();
        return _message;
      }
    } on FailureException catch (e) {
      _state = LoadingState.error;
      _message = e.message;
      notifyListeners();
      return _message;
    }
  }
}
