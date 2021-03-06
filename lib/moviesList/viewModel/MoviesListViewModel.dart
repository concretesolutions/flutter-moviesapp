import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/APIResponse.dart';
import '../../network/Decodable.dart';
import '../../network/Result.dart';
import '../../storage/FavoriteStorage.dart';
import '../../storage/FavoriteStorageProtocol.dart';
import '../model/Movie.dart';
import '../service/MoviesListService.dart';

class MoviesListViewModel extends ChangeNotifier {
  Response responseController;
  MoviesListService _service;
  List<Movie> _movies = [];
  FavoriteStorageProtocol _storage;
  int _page = 1;
  int _totalPages = 0;
  int _additionalListItems = 2;

  MoviesListViewModel([this._service, this._storage]) {
    _service = _service ?? MoviesListService();
    _storage = _storage ?? FavoriteStorage();
    responseController = Response.none();
  }

  void setResponse(Response response) {
    responseController = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _handleLoading();
    Result<Decodable> response = await _service.fetchMovies(_page);
    switch (response.result) {
      case ResultType.success:
        _handleSuccess(response.value);
        break;
      case ResultType.error:
        _handleError(response.errorValue.message);
    }
  }

  void _handleLoading() {
    if (_page == 1) {
      setResponse(Response.loading("Loading"));
    }
  }

  void _handleSuccess(Decodable value) {
    if (value is Movies) {
      Movies movies = value;
      _movies.addAll(movies.list);
      _totalPages = movies.totalPages;
      setResponse(Response.completed("Success"));
    } else {
      _handleError("Unable to decode movies model");
    }
  }

  void _handleError(String message) {
    if (_page == 1) {
      setResponse(Response.error(message));
    } else {
      _additionalListItems = 0;
    }
  }

  int moviesCount() {
    return _movies.length;
  }

  int itemsCount() {
    var additionalListItems = _additionalListItems;
    if (_page == _totalPages) {
      additionalListItems = 0;
    }
    return moviesCount() + additionalListItems;
  }

  Movie movieForIndex(int index) {
    return _movies[index];
  }

  bool isMovieFavorite(int index) {
    int id = _movies[index].id;
    return _storage.isFavoriteMovie(id);
  }

  bool shouldFetchNewPage() {
    if (_page == _totalPages) {
      return false;
    } else {
      _page += 1;
      return true;
    }
  }

  void handleFavoriteSelection(Movie movie) {
    int id = movie.id;
    if (_storage.isFavoriteMovie(id)) {
      _storage.unfavoriteMovie(id);
    } else {
      _storage.favoriteMovie(movie);
    }
  }
}
