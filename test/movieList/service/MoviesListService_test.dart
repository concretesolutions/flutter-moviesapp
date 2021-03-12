import 'package:moviesapp/moviesList/service/MoviesListService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/network/APIRequest.dart';
import '../../mocks/MockClient.dart';
import '../../mocks/MovieListRequestMock.dart';
import '../../utils/APIClientHelper.dart';

void main() {
  MoviesListService sut;
  APIClientMock apiMock;
  Uri urlRequest;
  APIRequest request;

  setUp(() {
    clientMock = MockClient();
    sut = MoviesListService(APIClientHelper.buildClient(clientMock));
    request = MoviesListRequestMock();
    urlRequest = APIClientHelper.buildRequest("/test", request.parameters);
  });
}
