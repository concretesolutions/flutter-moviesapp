import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';

class MovieCardViewModel {
  Color _iconColor = Colors.black54;
  Movie movie;

  void favoriteButtonState(Movie movie) {
    final favoriteStorage = FavoriteStorage();

    if (favoriteStorage.isFavoriteMovie(movie.id)) {
      _iconColor = Colors.black54;
      favoriteStorage.unfavoriteMovie(movie.id);
    } else {
      _iconColor = Colors.red;
      favoriteStorage.favoriteMovie(movie);
    }
  }

  void getItemColor() {
    final favoriteStorage = FavoriteStorage();
    if (favoriteStorage.isFavoriteMovie(movie.id) == true) {
      _iconColor = Colors.red;
    } else {
      _iconColor = Colors.black54;
    }
  }
}
