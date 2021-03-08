import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:moviesapp/config/Config.dart';
import 'package:moviesapp/network/APIRequest.dart';
import 'package:moviesapp/network/APIRequestMethod.dart';
import 'APIError.dart';

class APIClient {
  String _baseURL = "api.themoviedb.org";
  String _apiKey = Config.apiKey;
  http.Client _client = http.Client();

  Future<dynamic> request(APIRequest request) async {
    var _parameters = request.parameters;
    _parameters["api_key"] = _apiKey;
    Uri _url = Uri.https(_baseURL, "/3/" + request.path, _parameters);

    try {
      return _request(_url, request.method);
    } on SocketException {
      // TODO: Handle request failure
      throw FetchDataException('No Internet connection');
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
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw AuthenticationRequiredException(response.body.toString);
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw ServerErrorException(response.body.toString());
      default:
        throw FetchDataException('No Internet connection');
    }
  }
}
