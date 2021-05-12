import 'package:data_plugin/Movies.dart';
import 'package:data_plugin/data_plugin.dart';
import '../moviesList/model/Movie.dart';
import 'FavoriteStorageProtocol.dart';

class FavoriteStorage implements FavoriteStorageProtocol {
  List<Map<String, dynamic>> _responseNative;

  //FavoriteStorage([this.storage]) {
  //  storage = storage ?? LocalStorage('favorites');
  // }

  void _save(List<Movie> movies) {
    FavoritesList favoriteList = FavoritesList(movies);
    //storage.setItem('favorites', favoriteList.toJSONEncodable());
  }

  Future<List<Movie>> _read() async {
    _responseNative = await DataPlugin.getMovies;
    List<Movie> listMovie;

    print(_responseNative);

    for (var movie in _responseNative) {
      var a = Movie.fromJSON(movie);
      listMovie.add(a);
    }
    //return _responseNative.map((movieDict) => Movie.fromJSON(movieDict));
    return listMovie;
  }

  @override
  void favoriteMovie(Movie movie) {
    var favorites = _read();
    if (favorites == null) {
      //favorites = [movie] as Future<List<Movie>>;
    } else {
      //favorites.add(movie);
    }
    _save(favorites as List<Movie>);
  }

  @override
  Future<List<Movie>> getFavoritesMovies() {
    return _read();
  }

  @override
  bool isFavoriteMovie(int id) {
    List<Movie> favorites = _read() as List<Movie>;
    return favorites.any((movie) => movie.id == id);
  }

  @override
  void unfavoriteMovie(int id) {
    List<Movie> favorites = _read() as List<Movie>;
    favorites.removeWhere((item) => item.id == id);
    _save(favorites);
  }
}

class FavoritesList {
  List<Movie> items;

  FavoritesList(this.items) {
    items = items ?? List.empty();
  }
/*
  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
  */
}
