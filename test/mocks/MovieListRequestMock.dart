import 'package:moviesapp/network/APIRequest.dart';
import 'package:mockito/mockito.dart';
import 'package:moviesapp/network/APIRequestMethod.dart';

class MoviesListRequestMock extends Mock with APIRequest {
  @override
  APIRequestMethod get method => APIRequestMethod.get;

  @override
  Map<String, dynamic> get parameters => {"page": "15"};

  @override
  String get path => "/test";
}
