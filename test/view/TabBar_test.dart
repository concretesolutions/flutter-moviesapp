import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/view/TabBar.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';

void main() {
  group("TabBar -", () {
    testWidgets("TabMovies", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(TabBar()));

      final haveTwoMovies = find.text("Movies");

      expect(haveTwoMovies, findsNWidgets(2));

      await tester.tap(find.byIcon(CupertinoIcons.heart));
      await tester.pump();
      final haveOneMovie = find.text("Movies");

      expect(haveOneMovie, findsOneWidget);
    });

    testWidgets("TabFavorites", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(TabBar()));

      final haveOneFavorites = find.text("Favorites");
      expect(haveOneFavorites, findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.heart));
      await tester.pump();

      final haveTwoFavorites = find.text("Favorites");
      expect(haveTwoFavorites, findsNWidgets(2));


    });
  });
}
