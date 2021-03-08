class Movies {
  List<Movie> list;
  int page;
  int totalPages;
  int totalResults;

  Movies.fromJSON(Map<String, dynamic> json) {
    final jsonList = json["results"] as List;
    list = jsonList.map((jsonMovie) => Movie.fromJSON(jsonMovie)).toList();
    page = json["page"];
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }
}

class Movie {
  int id;
  String title;
  String overview;
  String poster;
  String releaseDate;
  //List<int> genreIds;

  Movie.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    overview = json["overview"];
    poster = json["poster_path"];
    releaseDate = json["release_date"];
    //genreIds = json["genre_ids"];
  }
}
