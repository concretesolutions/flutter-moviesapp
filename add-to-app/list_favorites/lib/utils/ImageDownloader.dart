import 'package:flutter/cupertino.dart';
import 'ImageURLBuilder.dart';

class ImageDownloader {
  Image loadCardImage(String path, double width) {
    String posterURL = ImageURLBuilder.build(path);
    return Image.network(posterURL, width: width, fit: BoxFit.fill);
  }

  Image loadCardFavoriteImage(String path) {
    String posterURL = ImageURLBuilder.build(path);
    return Image.network(posterURL, height: 100);
  }
}
