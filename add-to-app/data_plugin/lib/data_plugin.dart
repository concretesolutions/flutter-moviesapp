import 'dart:async';

import 'package:data_plugin/Movie.dart';
import 'package:data_plugin/Movies.dart';
import 'package:flutter/services.dart';

class DataPlugin {
  static const MethodChannel _channel = const MethodChannel('data_plugin');

  static Future<MovieReturn?> get getMovies async {
    final moviesResult = await _channel.invokeMethod('dataRealmSwiftFetch');
    var list = [];
    var nativeResponse = List.castFrom(moviesResult);

    nativeResponse.forEach((objeto) {
      var movie = objeto as Movie;
      list.add(movie);
    });

    return MovieReturn(list);
  }

  static Future<bool?> get saveMovie async {
    final result = await _channel.invokeMethod('dataRealmSwiftInsert');
    return true;
  }
}