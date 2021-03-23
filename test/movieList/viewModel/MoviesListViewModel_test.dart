import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/service/MoviesListService.dart';
import 'package:moviesapp/moviesList/viewModel/MoviesListViewModel.dart';
import 'package:moviesapp/network/APIResponse.dart';
import 'package:moviesapp/storage/FavoriteStorageProtocol.dart';

import '../../mocks/APIClientMock.dart';
import '../../mocks/MockFavoritesStorage.dart';
import '../../mocks/TestObject.dart';
import '../../stubs/MovieStubs.dart';

void main() {
  MoviesListViewModel sut;
  APIClientMock apiMock;
  List<Response> states;
  Movies movies;
  FavoriteStorageProtocol storage;
  Movie movie;

  setUp(() {
    apiMock = APIClientMock();
    storage = MockFavoritesStorage();
    sut = MoviesListViewModel(MoviesListService(apiMock), storage);
    states = [];
    movie = MovieStub.stub(10, "Bar");
    movies = MoviesStub.stub([movie, movie, movie], 1, 5);
    sut.addListener(() {
      states.add(sut.responseController);
    });
  });

  group("MoviesListViewModel -", () {
    group("Fetch Movies", () {
      group("handling success state", () {
        test("first page", () async {
          apiMock.decodableToReturn = movies;

          await sut.fetchMovies();

          expect(states.length, 2);
          expect(states.first.status, Status.LOADING);
          expect(states.last.status, Status.COMPLETED);
          expect(sut.moviesCount(), 3);
          expect(sut.itemsCount(), 5);
          expect(sut.movieForIndex(0).title, "Bar");
        });

        test("remaining pages", () async {
          apiMock.decodableToReturn = movies;

          await sut.fetchMovies();
          bool shouldFetchNewPage = sut.shouldFetchNewPage();
          states = [];
          await sut.fetchMovies();

          expect(shouldFetchNewPage, true);
          expect(states.length, 1);
          expect(states.first.status, Status.COMPLETED);
          expect(sut.moviesCount(), 6);
          expect(sut.itemsCount(), 8);
        });
      });

      group("handling error", () {
        test("first page", () async {
          apiMock.shouldReturnError = true;

          await sut.fetchMovies();

          expect(states.length, 2);
          expect(states.first.status, Status.LOADING);
          expect(states.last.status, Status.ERROR);
          expect(sut.itemsCount(), 2);
        });

        test("remaining pages", () async {
          apiMock.shouldReturnError = true;

          await sut.fetchMovies();
          sut.shouldFetchNewPage();
          states = [];
          await sut.fetchMovies();

          expect(states.length, 0);
          expect(sut.itemsCount(), 0);
        });

        test("decodable error", () async {
          apiMock.decodableToReturn = TestObject();

          await sut.fetchMovies();

          expect(states.length, 2);
          expect(states.first.status, Status.LOADING);
          expect(states.last.status, Status.ERROR);
        });
      });

      group("handling pagination", () {
        test("current page equals total pages", () async {
          int totalPages = 2;
          apiMock.decodableToReturn = MoviesStub.stub([], 1, totalPages);

          await sut.fetchMovies();
          bool firstPaginationTryAllowed = sut.shouldFetchNewPage();
          bool secondPaginationTryAllowed = sut.shouldFetchNewPage();

          expect(firstPaginationTryAllowed, true);
          expect(secondPaginationTryAllowed, false);
        });
      });

      group("handleFavoritesSeletion", () {
        test("favoriteMovie", () {
          bool didCallFavoriteMovie = false;

          when(storage.isFavoriteMovie(movie.id)).thenReturn(false);
          when(storage.favoriteMovie(movie)).thenAnswer((realInvocation) {
            didCallFavoriteMovie = true;
          });

          sut.handleFavoriteSelection(movie);

          expect(didCallFavoriteMovie, true);
        });

        test("favoriteMovie", () {
          bool didCallUnfavoriteMovie = false;

          when(storage.isFavoriteMovie(movie.id)).thenReturn(true);
          when(storage.unfavoriteMovie(movie.id)).thenAnswer((realInvocation) {
            didCallUnfavoriteMovie = true;
          });

          sut.handleFavoriteSelection(movie);

          expect(didCallUnfavoriteMovie, true);
        });
      });

      group("favoriteForIndex", () {
        test("", () async {
          Movie lastMovie = MovieStub.stub(15, "House");
          movies = MoviesStub.stub([movie, movie, movie, lastMovie], 1, 5);

          apiMock.decodableToReturn = movies;

          await sut.fetchMovies();

          when(storage.isFavoriteMovie(movie.id)).thenReturn(false);
          when(storage.isFavoriteMovie(lastMovie.id)).thenReturn(true);

          bool isFirstMovieFavorite = sut.isMovieFavorite(0);
          bool isLastMovieFavorite = sut.isMovieFavorite(3);

          expect(isFirstMovieFavorite, false);
          expect(isLastMovieFavorite, true);
        });
      });
    });
  });
}
