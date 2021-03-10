import 'package:moviesapp/network/APIClient.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/network/APIRequest.dart';
import 'package:moviesapp/network/Result.dart';
import '../mocks/MockClient.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../mocks/MovieListRequestMock.dart';
import '../mocks/TestObject.dart';
import '../utils/APIClientHelper.dart';

void main() {
  APIClient sut;
  MockClient clientMock;
  Uri urlRequest;
  APIRequest request;

  setUp(() {
    clientMock = MockClient();
    sut = APIClientHelper.buildClient(clientMock);
    request = MoviesListRequestMock();
    urlRequest = APIClientHelper.buildRequest("/test", request.parameters);
  });

  group("APIClient -", () {
    group("GET", () {
      group("Request decodable", () {
        test("Success", () async {
          when(clientMock.get(urlRequest))
              .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

          final response = await sut.requestDecodable(request, TestObject());
          final value = response.value as TestObject;

          expect(response.result, ResultType.success);
          expect(value.title, "Test");
        });

        test("Error", () async {
          when(clientMock.get(urlRequest))
              .thenAnswer((_) async => http.Response('Client error', 400));

          final response = await sut.requestDecodable(request, TestObject());

          expect(response.result, ResultType.error);
          expect(response.errorValue.message, 'Client error');
          expect(response.errorValue.statusCode, 400);
        });
      });

      group("Request", () {
        test("Success", () async {
          when(clientMock.get(urlRequest))
              .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

          final response = await sut.request(request);
          final value = response.value as String;

          expect(response.result, ResultType.success);
          expect(value, '{"title": "Test"}');
        });

        test("Error", () async {
          when(clientMock.get(urlRequest))
              .thenAnswer((_) async => http.Response('Server error', 500));

          final response = await sut.request(request);

          expect(response.result, ResultType.error);
          expect(response.errorValue.message, 'Server error');
          expect(response.errorValue.statusCode, 500);
        });
      });
    });
  });
}
