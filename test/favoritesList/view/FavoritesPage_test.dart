import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/favoritesList/view/FavoriteCard.dart';
import 'package:moviesapp/favoritesList/view/FavoritesPage.dart';
import 'package:flutter/material.dart';

import '../../mocks/FavoriteStorageMock.dart';
import '../../stubs/MovieStubs.dart';
import '../../utils/MockImageLoader.dart';
import '../../utils/utils.dart';

void main() {
  FavoritesPage sut;
  FavoriteStorageMock mock;

  setUp(() {
    mock = FavoriteStorageMock();
    sut = FavoritesPage(MockImageLoader(), mock);
  });

  group("FavoritesPage -", () {
    testWidgets("List state", (WidgetTester tester) async {
      final movie = MovieStub.stub();
      mock.moviesToReturn = [movie, movie, movie, movie];

      await tester.pumpWidget(makeTestable(sut));
      final list = find.byType(ListView);
      final cards = find.byType(FavoriteCard);

      expect(list, findsOneWidget);
      expect(cards, findsNWidgets(4));
    });

    testWidgets("Empty state", (WidgetTester tester) async {
      mock.moviesToReturn = [];

      await tester.pumpWidget(makeTestable(sut));
      final emptyState = find.text("You don't have any favorite movies yet. You can favorite in the list.");

      expect(emptyState, findsOneWidget);
    });
  });
}
