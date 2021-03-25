import 'APIRequestMethod.dart';

abstract class APIRequest {
  String get path;
  APIRequestMethod get method;
  Map<String, dynamic> get parameters;
}
