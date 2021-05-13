import 'dart:async';

import 'package:data_plugin/Movie.dart';
import 'package:data_plugin/Movies.dart';
import 'package:flutter/services.dart';

class DataPlugin {
  static const MethodChannel _channel = MethodChannel('data_plugin');

  // static Future<List<Map<String, dynamic>>> get getMovies async {
  //   List<Map<String, dynamic>> moviesResult =
  //       await _channel.invokeMethod('dataRealmSwiftFetch');

  //   return moviesResult;
  // }

  Future<List<Map<String, dynamic>>> getMovies() async {
    List<Map<String, dynamic>> moviesResult = [];

    List<dynamic> listIds =
        await _channel.invokeMethod('dataRealmSwiftFetchId');
    List<dynamic> listTitles =
        await _channel.invokeMethod('dataRealmSwiftFetchTitle');
    List<dynamic> listOver =
        await _channel.invokeMethod('dataRealmSwiftFetchOverview');
    List<dynamic> listPoster =
        await _channel.invokeMethod('dataRealmSwiftFetchPosterPath');
    List<dynamic> listDates =
        await _channel.invokeMethod('dataRealmSwiftFetchDates');

    int tam_itens = listIds.length;

    for (int i = 0; i < tam_itens; i++) {
      Map<String, dynamic> dict = {};
      dict['title'] = listIds[i];
      dict['title'] = listTitles[i];
      dict['overview'] = listOver[i];
      dict['poster_path'] = listPoster[i];
      dict['release_date'] = listDates[i];
      moviesResult.add(dict);
    }

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
