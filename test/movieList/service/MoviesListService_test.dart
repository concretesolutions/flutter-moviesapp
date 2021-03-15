import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListRequest.dart';
import 'package:moviesapp/moviesList/service/MoviesListService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/network/Result.dart';
import '../../mocks/APIClientMock.dart';

void main() {
  MoviesListService sut;
  APIClientMock apiMock;
  Movies movies;

  setUp(() {
    apiMock = APIClientMock();
    sut = MoviesListService(apiMock);
    Movie movie = Movie(
        id: 10,
        title: "Foo",
        overview: "Bar",
        poster: "Zoo",
        releaseDate: "Too");
    movies = Movies(
        list: [movie, movie, movie],
        page: 10,
        totalPages: 100,
        totalResults: 200);
  });

  group("MoviesListService", () {
    group("Fetch Movies", () {
      test("On Success", () async {
        apiMock.decodableToReturn = movies;

        final response = await sut.fetchMovies(1);
        Movies moviesResponse = response.value;

        expect(response.result, ResultType.success);
        expect(moviesResponse.list.length, 3);
        expect(moviesResponse.list.first.title, "Foo");
        expect(moviesResponse.totalPages, 100);
        expect(apiMock.requestPassed is MoviesListRequest, true);
        expect(apiMock.didCallRequestDecodable, true);
      });

      test("On Error", () async {
        apiMock.shouldReturnError = true;

        final response = await sut.fetchMovies(1);

        expect(response.result, ResultType.error);
        expect(apiMock.didCallRequestDecodable, true);
      });
    });
  });
}
