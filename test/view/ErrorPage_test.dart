import 'package:flutter_test/flutter_test.dart';
import 'package:moviesapp/view/ErrorPage.dart';
import '../utils/utils.dart';

void main() {
  bool didCallTryAgainCallback = false;
  testWidgets("ErrorPageTest", (WidgetTester tester) async {
    await tester.pumpWidget(
      makeTestable(
        ErrorPage(() {
          didCallTryAgainCallback = true;
        }),
      ),
    );
    var textViewWarning = find.text("Something went wrong! Please try again.");
    expect(textViewWarning, findsOneWidget);

    var buttonTextViewWarning = find.text("Try again");
    expect(buttonTextViewWarning, findsOneWidget);

    await tester.tap(find.text("Try again"));
    expect(didCallTryAgainCallback, true);
  });
}
