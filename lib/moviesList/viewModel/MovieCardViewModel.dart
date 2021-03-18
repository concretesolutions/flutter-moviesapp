import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';

class MovieCardViewModel {
  Movie movie;
  final favoriteStorage = FavoriteStorage();

  MovieCardViewModel(this.movie);

  void favoriteButtonState() {
    if (favoriteStorage.isFavoriteMovie(movie.id)) {
      favoriteStorage.unfavoriteMovie(movie.id);
    } else {
      favoriteStorage.favoriteMovie(movie);
    }
  }

  Color getItemColor() {
    if (favoriteStorage.isFavoriteMovie(movie.id)) {
      return Colors.red;
    } else {
      return Colors.black54;
    }
  }
}
