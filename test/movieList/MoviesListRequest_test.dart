import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/moviesList/service/MoviesListRequest.dart';
import 'package:moviesapp/network/APIRequestMethod.dart';

void main() {
  MoviesListRequest sut;

  setUp(() {
    sut = MoviesListRequest();
  });

  group("MoviesListRequest -", () {
    test("Method", () {
      expect(sut.method, APIRequestMethod.get);
    });

    test("Parameters", () {
      expect(sut.parameters, {"page": "15"});
    });

    test("Path", () {
      expect(sut.path, "movie/popular");
    });
  });
}
