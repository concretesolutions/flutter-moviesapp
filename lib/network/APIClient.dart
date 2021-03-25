import 'dart:async';

import 'package:http/http.dart' as http;

import '../config/Config.dart';
import 'APIError.dart';
import 'APIRequest.dart';
import 'APIRequestMethod.dart';
import 'Decodable.dart';
import 'Result.dart';

class APIClient {
  String _baseURL;
  String _apiKey;
  http.Client _client;

  APIClient([this._baseURL, this._client, this._apiKey]) {
    _baseURL = _baseURL ?? "api.themoviedb.org";
    _client = _client ?? http.Client();
    _apiKey = _apiKey ?? Config.apiKey;
  }

  Future<Result> request(APIRequest request) async {
    var _parameters = request.parameters;
    _parameters["api_key"] = _apiKey;
    Uri _url = Uri.https(_baseURL, "/3/" + request.path, _parameters);
    try {
      dynamic data = await _request(_url, request.method);
      return Result.success(data);
    } on APIError catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<Decodable>> requestDecodable(
      APIRequest request, Decodable type) async {
    var _parameters = request.parameters;
    _parameters["api_key"] = _apiKey;
    Uri _url = Uri.https(_baseURL, "/3/" + request.path, _parameters);

    try {
      dynamic data = await _request(_url, request.method);
      Decodable decodable = Decodable(type, data);
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
