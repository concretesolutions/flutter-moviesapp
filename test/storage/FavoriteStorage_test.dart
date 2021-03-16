import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';
import 'package:mockito/mockito.dart';

import '../mocks/MockLocalStorage.dart';
import '../stubs/MovieStubs.dart';

void main() {
  FavoriteStorage sut;
  Movie movie;
  MockLocalStorage storage;

  setUp(() {
    storage = MockLocalStorage();
    sut = FavoriteStorage(storage);
    movie = MovieStub.stub(10, "Bar");
  });

  group("FavoriteStorage -", () {
    group("contentItem", () {
      test("true", () {
        final movie2 = MovieStub.stub(12, "Ber");
        final List<Movie> movies = [movie, movie2];
        final FavoritesList favorites = FavoritesList(movies);

        when(storage.getItem("favorites"))
            .thenReturn(favorites.toJSONEncodable());

        sut.favoriteMovie(movie);
        final contentItem = sut.isFavoriteMovie(10);

        expect(contentItem, true);
      });

      // test("false", () {
      //   final contentItem = sut.contentItem(10);

      //   expect(contentItem, false);
      // });
    });
  });
}
