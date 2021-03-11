import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListService.dart';
import 'package:moviesapp/network/APIResponse.dart';
import 'package:moviesapp/network/Decodable.dart';
import 'package:moviesapp/network/Result.dart';

class MoviesListViewModel extends ChangeNotifier {
  Response responseController;
  MoviesListService _service;
  List<Movie> _movies = [];
  int _page = 1;
  int _totalPages = 0;
  int _additionalListItems = 2;

  MoviesListViewModel([this._service]) {
    _service = _service ?? MoviesListService();
    responseController = Response.none();
  }

  void setResponse(Response response) {
    responseController = response;
    notifyListeners();
  }

  void fetchMovies() async {
    _handleLoading();
    final response = await _service.fetchMovies(_page);
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
      this._movies.addAll(movies.list);
      this._totalPages = movies.totalPages;
      print("Total pages: $_totalPages");
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

  bool shouldFetchNewPage() {
    if (_page == _totalPages) {
      return false;
    } else {
      _page += 1;
      return true;
    }
  }
}
