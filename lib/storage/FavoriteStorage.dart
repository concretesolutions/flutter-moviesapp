import 'package:localstorage/localstorage.dart';
import '../moviesList/model/Movie.dart';
import 'FavoriteStorageProtocol.dart';

class FavoriteStorage implements FavoriteStorageProtocol {
  LocalStorage storage;

  FavoriteStorage([this.storage]) {
    storage = storage ?? LocalStorage('favorites');
  }

  void _save(List<Movie> movies) {
    FavoritesList favoriteList = FavoritesList(movies);
    storage.setItem('favorites', favoriteList.toJSONEncodable());
  }

  List<Movie> _read() {
    List favorites = storage.getItem('favorites');
    if (favorites == null) return [];
    List<Movie> listMovies =
        favorites.map((favorite) => Movie.fromJSON(favorite)).toList();
    return listMovies;
  }

  @override
  void favoriteMovie(Movie movie) {
    var favorites = _read();
    if (favorites == null) {
      favorites = [movie];
    } else {
      favorites.add(movie);
    }
    _save(favorites);
  }

  @override
  List<Movie> getFavoritesMovies() {
    return _read();
  }

  @override
  bool isFavoriteMovie(int id) {
    List<Movie> favorites = _read();
    return favorites.any((movie) => movie.id == id);
  }

  @override
  void unfavoriteMovie(int id) {
    List<Movie> favorites = _read();
    favorites.removeWhere((item) => item.id == id);
    _save(favorites);
  }
}

class FavoritesList {
  List<Movie> items;

  FavoritesList(this.items) {
    items = items ?? List.empty();
  }

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
