import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListRequest.dart';
import 'package:moviesapp/network/APIClient.dart';
import 'package:moviesapp/network/Decodable.dart';
import 'package:moviesapp/network/Result.dart';

class MoviesListService {
  APIClient _client;

  MoviesListService([this._client]) {
    _client = _client ?? APIClient();
  }

  Future<Result<Decodable>> fetchMovies(int page) async {
    final request = MoviesListRequest(page);
    return await _client.requestDecodable(request, Movies());
  }
}
