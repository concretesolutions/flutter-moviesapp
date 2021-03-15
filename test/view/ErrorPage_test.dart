import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/view/ErrorPage.dart';
import '../utils/utils.dart';

void main() {
  testWidgets("ErrorPageTest", (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(ErrorPage(callback)));
    var textViewWarning = find.text("Something went wrong! Please try again.");
    expect(textViewWarning, findsOneWidget);
  });
}
