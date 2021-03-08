import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListRequest.dart';
import 'package:moviesapp/network/APIClient.dart';

class MoviesListService {
  APIClient _client;

  MoviesListService([this._client]) {
    _client = _client ?? APIClient();
  }

  Future<Movies> fetchMovies() async {
    final request = MoviesListRequest();
    final response = await _client.request(request);
    final movies = Movies.fromJSON(response);
    return movies;
  }
}
