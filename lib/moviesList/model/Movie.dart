import 'package:moviesapp/network/Decodable.dart';

class Movies implements Decodable {
  List<Movie> list;
  int page;
  int totalPages;
  int totalResults;

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    final jsonList = json["results"] as List;
    list = jsonList.map((jsonMovie) => Movie.fromJSON(jsonMovie)).toList();
    page = json["page"];
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
    return this;
  }
}

class Movie {
  int id;
  String title;
  String overview;
  String poster;
  String releaseDate;

  Movie.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    overview = json["overview"];
    poster = json["poster_path"];
    releaseDate = json["release_date"];
  }
}
