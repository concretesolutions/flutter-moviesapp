import 'package:moviesapp/config/Config.dart';

class ImageURLBuilder {
  static String build(String path) {
    final baseURL = "image.tmdb.org";
    final parameters = {"api_key": Config.apiKey};
    Uri _url = Uri.https(baseURL, "/t/p/w154" + path, parameters);
    return _url.toString();
  }
}
