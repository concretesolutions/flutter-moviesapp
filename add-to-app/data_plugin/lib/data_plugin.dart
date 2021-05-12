import 'dart:async';

import 'package:data_plugin/Movie.dart';
import 'package:data_plugin/Movies.dart';
import 'package:flutter/services.dart';

class DataPlugin {
  static const MethodChannel _channel = MethodChannel('data_plugin');

  static Future<List<Map<String, dynamic>>> get getMovies async {
    List<Map<String, dynamic>> moviesResult =
        await _channel.invokeMethod('dataRealmSwiftFetch');

    return moviesResult;
  }

  static Future<bool> saveMovie(int id, String title, String path,
      String overview, String release_date) async {
    final result =
        await _channel.invokeMethod('dataRealmSwiftInsert', <String, dynamic>{
      'id': id,
      'title': title,
      'path': path,
      'overview': overview,
      'release_date': release_date
    });

    return true;
  }
}
