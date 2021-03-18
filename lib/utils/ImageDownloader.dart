import 'package:flutter/cupertino.dart';
import 'package:moviesapp/utils/ImageURLBuilder.dart';

class ImageDownloader {
  Image loadCardImage(String path, double width) {
    final posterURL = ImageURLBuilder.build(path);
    return Image.network(posterURL, width: width, fit: BoxFit.fill);
  }
}
