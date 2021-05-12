import '../moviesList/model/Movie.dart';

abstract class FavoriteStorageProtocol {
  void favoriteMovie(Movie movie);

  Future<List<Movie>> getFavoritesMovies();

  void unfavoriteMovie(int id);

  bool isFavoriteMovie(int id);
}
