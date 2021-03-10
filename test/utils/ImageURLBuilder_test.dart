import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/utils/ImageURLBuilder.dart';

void main() {
  group("ImageURLBuilder -", () {
    test("Build", () {
      final String finalURL = ImageURLBuilder.build("/mypath");
      expect(
          finalURL.contains("https://image.tmdb.org/t/p/w154/mypath?apikey="),
          true);
    });
  });
}
