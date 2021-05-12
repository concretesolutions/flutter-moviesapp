import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_favorites/moviesList/model/Movie.dart';
import 'APIResponse.dart';
import '../../storage/FavoriteStorage.dart';
import '../../storage/FavoriteStorageProtocol.dart';

class FavoriteViewModel extends ChangeNotifier {
  Response responseController;
  FavoriteStorageProtocol _storage;

  FavoriteViewModel([this._storage]) {
    _storage = _storage ?? FavoriteStorage();
    responseController = Response.none();
  }

  void setResponse(Response response) {
    responseController = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    List<Movie> response = await _storage.getFavoritesMovies();
    if (response.isEmpty) {
      setResponse(
          Response.completed([Movie(0, 'Error', 'Error', 'Error', 'Error')]));
    } else {
      setResponse(Response.completed(response));
    }
  }
}
