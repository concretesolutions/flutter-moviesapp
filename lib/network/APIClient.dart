import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:moviesapp/config/Config.dart';
import 'package:moviesapp/network/APIRequest.dart';
import 'package:moviesapp/network/APIRequestMethod.dart';
import 'package:moviesapp/network/Decodable.dart';
import 'package:moviesapp/network/Result.dart';
import 'APIError.dart';

class APIClient {
  String _baseURL = "api.themoviedb.org";
  String _apiKey = Config.apiKey;
  http.Client _client = http.Client();

  Future<Result> request(APIRequest request) async {
    var _parameters = request.parameters;
    _parameters["api_key"] = _apiKey;
    Uri _url = Uri.https(_baseURL, "/3/" + request.path, _parameters);
    try {
      final data = await _request(_url, request.method);
      return Result.success(data);
    } on APIError catch (error) {
      throw Result.error(error);
    }
  }

  Future<Result<Decodable>> requestDecodable(
      APIRequest request, Decodable type) async {
    var _parameters = request.parameters;
    _parameters["api_key"] = _apiKey;
    Uri _url = Uri.https(_baseURL, "/3/" + request.path, _parameters);

    try {
      final data = await _request(_url, request.method);
      final decodable = Decodable(type, data);
      return Result.success(decodable);
    } on APIError catch (error) {
      return Result.error(error);
    }
  }

  Future<dynamic> _request(Uri _url, APIRequestMethod method) async {
    switch (method) {
      case APIRequestMethod.get:
        return _handleResponse(await _client.get(_url));
      case APIRequestMethod.post:
        return _handleResponse(await _client.post(_url));
      case APIRequestMethod.delete:
        return _handleResponse(await _client.delete(_url));
    }
  }

  dynamic _handleResponse(http.Response response) {
    int statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      return response.body.toString();
    } else if (statusCode >= 400 && statusCode < 500) {
      throw ClientErrorException(response.body.toString(), response.statusCode);
    } else if (statusCode >= 500 && statusCode < 600) {
      throw ServerErrorException(response.body.toString(), response.statusCode);
    } else {
      throw UndefinedErrorException("Undefined error", response.statusCode);
    }
  }
}
