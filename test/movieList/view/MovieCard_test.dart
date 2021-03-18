import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/moviesList/view/MovieCard.dart';
import 'package:flutter/cupertino.dart';

import '../../stubs/MovieStubs.dart';
import '../../utils/MockImageLoader.dart';
import '../../utils/utils.dart';

void main() {
  MovieCard sut;

  setUp(() {
    sut = MovieCard(
        MovieStub.stub(10, "Best movie in the world"), MockImageLoader());
  });

  group("MovieCard", () {
    testWidgets("created", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(sut));

      final image = find.byType(Image);
      final title = find.text("Best movie in the world");

      expect(image, findsOneWidget);
      expect(title, findsOneWidget);
    });
  });
}
