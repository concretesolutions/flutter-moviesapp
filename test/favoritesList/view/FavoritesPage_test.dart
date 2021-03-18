import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/favoritesList/view/FavoritesPage.dart';
import 'package:flutter/material.dart';

import '../../utils/MockImageLoader.dart';
import '../../utils/utils.dart';

void main() {
  FavoritesPage sut;

  setUp(() {
    sut = FavoritesPage(MockImageLoader());
  });

  group("FavoritesPage", () {
    testWidgets("List state", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(sut));
      final list = find.byType(ListView);

      expect(list, findsOneWidget);
    });
  });
}
