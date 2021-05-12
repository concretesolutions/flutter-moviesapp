import '../config/Config.dart';

class ImageURLBuilder {
  static String build(String path) {
    String baseURL = "image.tmdb.org";
    Map<String, String> parameters = {"api_key": Config.apiKey};
    Uri _url = Uri.https(baseURL, "/t/p/w154" + path, parameters);
    return _url.toString();
  }
}
