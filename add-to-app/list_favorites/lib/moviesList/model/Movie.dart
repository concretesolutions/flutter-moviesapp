/*import '../../network/Decodable.dart';

class Movies implements Decodable {
  List<Movie> list;
  int page;
  int totalPages;
  int totalResults;

  Movies({this.list, this.page, this.totalPages, this.totalResults});

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    List jsonList = json["results"] as List;
    list = jsonList.map((jsonMovie) => Movie.fromJSON(jsonMovie)).toList();
    page = json["page"];
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
    return this;
  }
}
*/
class Movie {
  int id;
  String title;
  String overview;
  String poster;
  String releaseDate;

  Movie(this.id, this.title, this.overview, this.poster, this.releaseDate);

  
  Movie.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    overview = json["overview"];
    poster = json["poster_path"];
    releaseDate = json["release_date"];
  }

  toJSONEncodable() {
    Map<String, dynamic> json = Map();

    json["id"] = id;
    json["title"] = title;
    json["overview"] = overview;
    json["poster_path"] = poster;
    json["release_date"] = releaseDate;

    return json;
  }
  
}
