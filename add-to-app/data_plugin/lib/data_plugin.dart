import 'dart:async';

import 'package:data_plugin/Movie.dart';
import 'package:data_plugin/Movies.dart';
import 'package:flutter/services.dart';

class DataPlugin {
  static const MethodChannel _channel = MethodChannel('data_plugin');

  static Future<Map<dynamic, dynamic>?> get getMovies async {
    final Map<dynamic, dynamic> moviesResult =
        await _channel.invokeMethod('dataRealmSwiftFetch');

    //print(moviesResult.entries);

    return moviesResult;
  }

  static Future<bool?> saveMovie(
      String title, String path, String overview) async {
    final result = await _channel.invokeMethod('dataRealmSwiftInsert',
        <String, dynamic>{'title': title, 'path': path, 'overview': overview});
    return true;
  }
}
