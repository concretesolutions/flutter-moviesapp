import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';
import 'package:mockito/mockito.dart';

import '../mocks/MockLocalStorage.dart';
import '../stubs/MovieStubs.dart';

void main() {
  FavoriteStorage sut;
  Movie movie;
  Movie movie2;
  MockLocalStorage storage;
  FavoritesList favorites;

  setUp(() {
    storage = MockLocalStorage();
    sut = FavoriteStorage(storage);
    movie = MovieStub.stub(10, "Bar");
    movie2 = MovieStub.stub(12, "Ber");
    final List<Movie> movies = [movie, movie2];
    favorites = FavoritesList(movies);
  });

  group("FavoriteStorage -", () {
    group("isFavoriteMovie", () {
      test("true", () {
        when(storage.getItem("favorites"))
            .thenReturn(favorites.toJSONEncodable());

        sut.favoriteMovie(movie);
        final contentItem = sut.isFavoriteMovie(10);

        expect(contentItem, true);
      });

      test("false", () {
        when(storage.getItem("favorites"))
            .thenReturn(favorites.toJSONEncodable());

        sut.favoriteMovie(movie);
        final contentItem = sut.isFavoriteMovie(15);

        expect(contentItem, false);
      });
    });

    test("favoriteMovie", () {
      when(storage.getItem("favorites"))
          .thenReturn(favorites.toJSONEncodable());

      sut.favoriteMovie(movie2);
      final contentItem = sut.isFavoriteMovie(12);

      expect(contentItem, true);
    });

    test("unFavoriteMovie", () {
      favorites = FavoritesList([movie]);

      when(storage.getItem("favorites"))
          .thenReturn(favorites.toJSONEncodable());

      sut.favoriteMovie(movie2);
      sut.unfavoriteMovie(12);
      final contentItem = sut.isFavoriteMovie(12);

      expect(contentItem, false);
    });

    test("getFavoriteMovies", () {
      when(storage.getItem("favorites"))
          .thenReturn(favorites.toJSONEncodable());

      final favoritesMovies = sut.getFavoritesMovies();

      expect(favoritesMovies.length, 2);
      expect(favoritesMovies.first.title, "Bar");
    });
  });
}
