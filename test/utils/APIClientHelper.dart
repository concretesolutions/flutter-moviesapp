import 'package:moviesapp/network/APIClient.dart';

import '../mocks/MockClient.dart';

class APIClientHelper {
  static String testBaseURL = "www.test.com";
  static String apiKey = "128394819284918";

  static Uri buildRequest(String path, Map<String, dynamic> parameters) {
    var _parameters = parameters;
    _parameters["api_key"] = apiKey;

    return Uri.https(testBaseURL, "/3/" + path, _parameters);
  }

  static APIClient buildClient(MockClient clientMock) {
    return APIClient(testBaseURL, clientMock, apiKey);
  }
}
