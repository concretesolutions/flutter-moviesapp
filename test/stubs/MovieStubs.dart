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
