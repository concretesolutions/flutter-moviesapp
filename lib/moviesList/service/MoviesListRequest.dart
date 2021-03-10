import 'package:moviesapp/network/APIRequest.dart';
import 'package:moviesapp/network/APIRequestMethod.dart';

class MoviesListRequest extends APIRequest {
  @override
  APIRequestMethod get method => APIRequestMethod.get;

  @override
  Map<String, dynamic> get parameters => {"page": "15"};

  @override
  String get path => "movie/popular";
}
