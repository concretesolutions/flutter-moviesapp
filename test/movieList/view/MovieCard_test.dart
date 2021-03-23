import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moviesapp/moviesList/view/MovieCard.dart';
import 'package:flutter/cupertino.dart';

import '../../stubs/MovieStubs.dart';
import '../../utils/MockImageLoader.dart';
import '../../utils/utils.dart';

void main() {
  MovieCard sut;

  setUp(() {
    sut = MovieCard(MovieStub.stub(10, "Best movie in the world"),
        MockImageLoader(), true, (movie) {});
  });

  group("MovieCard", () {
    testWidgets("created", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(sut));

      final image = find.byType(Image);
      final title = find.text("Best movie in the world");
      final favoriteButton = find.byType(IconButton);

      expect(image, findsOneWidget);
      expect(title, findsOneWidget);
      expect(favoriteButton, findsOneWidget);
    });

    group("favoriteButton", () {
      testWidgets("favorite", (WidgetTester tester) async {
        await tester.pumpWidget(makeTestable(sut));

        final favoriteWidget = find.byType(Icon);
        final favoriteButton = tester.firstWidget(favoriteWidget) as Icon;

        await tester.tap(favoriteWidget);
        await tester.pump();

        expect(favoriteButton.color, Colors.red);
      });

      testWidgets("unfavorite", (WidgetTester tester) async {
        sut = MovieCard(MovieStub.stub(10, "Best movie in the world"),
            MockImageLoader(), false, (movie) {});

        await tester.pumpWidget(makeTestable(sut));

        final favoriteWidget = find.byType(Icon);
        final favoriteButton = tester.firstWidget(favoriteWidget) as Icon;

        await tester.tap(favoriteWidget);
        await tester.pump();

        expect(favoriteButton.color, Colors.black54);
      });
    });
  });
}
