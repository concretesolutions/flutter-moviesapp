import '../../moviesList/model/Movie.dart';
import '../../storage/FavoriteStorage.dart';
import '../../storage/FavoriteStorageProtocol.dart';
import '../../utils/ImageDownloader.dart';

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

  Future<void> handleFavoriteSelection() async{
    int id = movie.id;
    if (_storage.isFavoriteMovie(id)) {
      _storage.unfavoriteMovie(id);
    } else {
      _storage.favoriteMovie(movie);
    }
  }
}
