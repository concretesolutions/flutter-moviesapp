import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/favoritesList/view/FavoriteCard.dart';
import 'package:flutter/material.dart';

import '../../stubs/MovieStubs.dart';
import '../../utils/MockImageLoader.dart';
import '../../utils/utils.dart';

void main() {
  FavoriteCard sut;

  setUp(() {
    final movie = MovieStub.stub(10, "Title", "Overview", "", "2021");
    sut = FavoriteCard(movie, MockImageLoader());
  });

  group("FavoriteCard", () {
    testWidgets("loaded", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(sut));
      final image = find.byType(Image);
      final texts = find.byType(Text);

      expect(image, findsOneWidget);
      expect(texts, findsNWidgets(3));
    });
  });
}
