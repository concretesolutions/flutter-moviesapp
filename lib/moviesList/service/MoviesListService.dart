import '../../network/APIClient.dart';
import '../../network/Decodable.dart';
import '../../network/Result.dart';
import '../model/Movie.dart';
import 'MoviesListRequest.dart';

class MoviesListService {
  APIClient _client;

  MoviesListService([this._client]) {
    _client = _client ?? APIClient();
  }

  Future<Result<Decodable>> fetchMovies(int page) async {
    MoviesListRequest request = MoviesListRequest(page);
    return await _client.requestDecodable(request, Movies());
  }
}
