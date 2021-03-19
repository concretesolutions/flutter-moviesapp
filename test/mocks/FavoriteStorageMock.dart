import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/FavoriteStorageProtocol.dart';

import '../stubs/MovieStubs.dart';

class FavoriteStorageMock implements FavoriteStorageProtocol {
  List<Movie> moviesToReturn = [MovieStub.stub(), MovieStub.stub()];

  @override
  void favoriteMovie(Movie movie) {}

  @override
  List<Movie> getFavoritesMovies() {
    return moviesToReturn;
  }

  @override
  bool isFavoriteMovie(int id) {
    return false;
  }

  @override
  void unfavoriteMovie(int id) {}
}
