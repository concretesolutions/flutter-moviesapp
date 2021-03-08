import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'APIError.dart';

class APIClient {
  String _baseURL = "api.themoviedb.org";
  String _apiKey = "18c1afb840d17621435b98dd49866826";
  http.Client _client = http.Client();

  Future<dynamic> get(String path) async {
    var responseJSON;
    final _parameters = {"api_key": _apiKey};
    Uri _url = Uri.https(_baseURL, "/3/" + path, _parameters);

    try {
      final response = await _client.get(_url);
      responseJSON = _responseToJSON(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJSON;
  }

  dynamic _responseToJSON(http.Response response) {
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
