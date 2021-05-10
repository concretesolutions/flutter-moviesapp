import 'dart:async';

import 'package:flutter/services.dart';

class DataPlugin {
  static const MethodChannel _channel = const MethodChannel('data_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get getMovies async {
    final String? version = await _channel.invokeMethod('dataRealmSwiftFetch');
    return version;
  }
}
