import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListService.dart';
import 'package:moviesapp/network/APIResponse.dart';
import 'package:moviesapp/network/Result.dart';

class MoviesListViewModel extends ChangeNotifier {
  Response responseController;
  MoviesListService _service;
  List<Movie> _movies = [];
  int _page = 4;

  MoviesListViewModel([this._service]) {
    _service = _service ?? MoviesListService();
    responseController = Response.none();
  }

  void setResponse(Response response) {
    responseController = response;
    notifyListeners();
  }

  void fetchMovies() async {
    setResponse(Response.loading("Loading"));
    final response = await _service.fetchMovies(_page);
    switch (response.result) {
      case ResultType.success:
        if (response.value is Movies) {
          Movies movies = response.value;
          this._movies = movies.list;
          setResponse(Response.completed("Success"));
        } else {
          setResponse(Response.error("Unable to decode movies model"));
        }
        break;
      case ResultType.error:
        final errorValue = response.errorValue;
        setResponse(Response.error(errorValue.message));
    }
  }

  int moviesCount() {
    return _movies.length;
  }

  Movie movieForIndex(int index) {
    return _movies[index];
  }
}
