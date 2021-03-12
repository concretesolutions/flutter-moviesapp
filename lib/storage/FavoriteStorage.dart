import 'package:localstorage/localstorage.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/StorageProtocol.dart';

class FavoriteStorage implements StorageProtocol {
  LocalStorage storage = LocalStorage('favorites');
  FavoritesList list = FavoritesList();

  @override
  void deleteItem(String key) {
    storage.deleteItem(key);
  }

  @override
  dynamic getItem(String key) {
    return storage.getItem(key);
  }

  @override
  void setItem(String key, value) {
    storage.setItem(key, value);
  }

  bool contentItem(int id) {
    List<Movie> favorites = getItem('favorites');
    if (favorites.any((item) => item.id == id)) {
      return true;
    }
    return false;
  }

  void favoriteItem(Movie movie) {
    List<Movie> favorites = getItem('favorites');
    favorites.add(movie);
    list.items = favorites;
    setItem('favorites', list.toJSONEncodable());
  }

  void unfavoriteItem(Movie movie) {
    List<Movie> favorites = getItem('favorites');
    favorites.removeWhere((item) => item.id == movie.id);
    list.items = favorites;
    setItem('avorites', list.toJSONEncodable());
  }

  FavoritesList readFavorites() {
    return getItem('favorites') as FavoritesList;
  }
}

class FavoritesList {
  List<Movie> items;

  FavoritesList() {
    items = new List();
  }

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
