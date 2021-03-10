import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListRequest.dart';
import 'package:moviesapp/network/APIClient.dart';
import 'package:moviesapp/network/Result.dart';

class MoviesListService {
  APIClient _client;

  MoviesListService([this._client]) {
    _client = _client ?? APIClient();
  }

  void fetchMovies() async {
    final request = MoviesListRequest();
    final response = await _client.requestDecodable(request, Movies());

    switch (response.result) {
      case ResultType.success:
        if (response.value is Movies) {
          Movies movies = response.value;
          print(movies);
        }
        break;
      case ResultType.error:
        final errorValue = response.errorValue;
        print(errorValue);
    }
  }
}
