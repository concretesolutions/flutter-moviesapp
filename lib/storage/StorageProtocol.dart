import 'package:moviesapp/moviesList/model/Movie.dart';

abstract class StorageProtocol {
  void setItem(String key, dynamic value);

  dynamic getItem(String key);

  void deleteItem(String key);
}
