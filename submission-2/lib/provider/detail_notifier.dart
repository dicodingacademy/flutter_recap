import 'package:flutter/material.dart';
import 'package:flutter_recap/model/failure_exception.dart';
import 'package:flutter_recap/model/loading_state.dart';
import 'package:flutter_recap/service/api_service.dart';

class DetailNotifier extends ChangeNotifier {
  LoadingState _state = LoadingState.initial;
  String? _image;
  String _message = "";

  LoadingState get state => _state;
  String get image => _image ?? "";
  String get message => _message;

  Future<dynamic> loadDogBreed(String breed) async {
    try {
      _state = LoadingState.loading;
      notifyListeners();

      final result = await ApiService().dogBreed(breed);

      if (result.status == "success") {
        _state = LoadingState.loaded;
        _message = result.status;
        _image = result.message;

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
