import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/network/APIClient.dart';

class MoviesListService {
  APIClient _client;

  MoviesListService([this._client]) {
    _client = _client ?? APIClient();
  }

  Future<Movies> fetchMovies() async {
    final response = await _client.get("movie/popular");
    final movies = Movies.fromJSON(response);
    print(movies.list.first.title);
    return movies;
  }
}
