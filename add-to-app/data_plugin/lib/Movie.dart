import 'dart:convert';

import 'dart:ffi';

class Movie {
  final String title;
  final String path;
  final String Overview;

  Movie(this.title, this.path, this.Overview);
}