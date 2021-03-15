import 'package:moviesapp/moviesList/model/Movie.dart';

extension MovieStub on Movie {
  static Movie stub(
      [int id,
      String title,
      String overview,
      String poster,
      String releaseDate]) {
    return Movie(
        id: id ?? 10,
        title: title ?? "Foo",
        overview: overview ?? "Bar",
        poster: poster ?? "Zoo",
        releaseDate: releaseDate ?? "Too");
  }
}

extension MoviesStub on Movies {
  static Movies stub(
      [List<Movie> list, int page, int totalPages, int totalResults]) {
    return Movies(
        list: list ?? [MovieStub.stub(), MovieStub.stub(), MovieStub.stub()],
        page: page ?? 10,
        totalPages: totalPages ?? 100,
        totalResults: totalResults ?? 200);
  }
}
