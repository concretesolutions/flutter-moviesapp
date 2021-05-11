import 'dart:async';

import 'package:flutter/services.dart';

class DataPlugin {
  static const MethodChannel _channel = MethodChannel('data_plugin');

  static Future<String> get platformVersion async {
    String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get getMovies async {
    String version = await _channel.invokeMethod('dataRealmSwiftFetch');
    return version;
  }
  
}
