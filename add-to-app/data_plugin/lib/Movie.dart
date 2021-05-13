import 'dart:convert';

import 'dart:ffi';

class Movie {
  final int id;
  final String title;
  final String path;
  final String overview;
  final String release_date;

  Movie(this.id, this.title, this.path, this.overview, this.release_date);
}
