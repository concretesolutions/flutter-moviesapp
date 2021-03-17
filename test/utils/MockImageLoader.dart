import 'package:flutter/cupertino.dart';
import 'package:moviesapp/utils/ImageLoader.dart';

class MockImageLoader extends ImageLoader {
  @override
  Image loadCardImage(String path, double width) {
    return Image(image: AssetImage("assets/movieBackground.jpg"));
  }
}
