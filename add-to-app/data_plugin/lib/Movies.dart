import 'dart:convert';

import 'dart:ffi';

import 'package:data_plugin/Movie.dart';

class MovieReturn {
  Map<String, dynamic> listMovies = {};

  MovieReturn(this.listMovies);

  static Map<String, dynamic> toList(List<dynamic> listParse) {
    Map<String, dynamic> dictResult = {};

    listParse.forEach((element) {
      var dict = element as Map<String, dynamic>;
      element.forEach((key, value) {
        var chave = key as String;
        if (chave == 'id') {
          dictResult['id'] = value;
        }
        if (chave == 'title') {
          dictResult['title'] = value;
        }
        if (chave == 'path') {
          dictResult['path'] = value;
        }
        if (chave == 'overview') {
          dictResult['overvies'] = value;
        }
        if (chave == 'release_date') {
          dictResult['release_date'] = value;
        }
      });
    });

    return dictResult;
  }
}
