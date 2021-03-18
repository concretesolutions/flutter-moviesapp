import 'package:flutter/cupertino.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';

class MockImageLoader extends ImageDownloader {
  @override
  Image loadCardImage(String path, double width) {
    return Image(image: AssetImage("assets/movieBackground.jpg"));
  }
}
