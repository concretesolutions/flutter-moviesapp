import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';
import 'package:moviesapp/storage/FavoriteStorageProtocol.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';

class MovieDetailViewModel {
  Movie movie;
  bool isFavorited;
  FavoriteStorageProtocol _storage;
  ImageDownloader loader;

  MovieDetailViewModel(
      [this.movie, this.isFavorited, this._storage, this.loader]) {
    _storage = _storage ?? FavoriteStorage();
    loader = loader ?? ImageDownloader();
    movie = movie;
    isFavorited = isFavorited;
  }

  void handleFavoriteSelection() {
    final id = movie.id;
    if (_storage.isFavoriteMovie(id)) {
      _storage.unfavoriteMovie(id);
    } else {
      _storage.favoriteMovie(movie);
    }
  }
}
