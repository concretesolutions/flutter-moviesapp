import 'package:flutter/cupertino.dart';
import 'view/TabBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return CupertinoApp(
        theme: CupertinoThemeData(
          barBackgroundColor: CupertinoColors.systemYellow,
          primaryColor: CupertinoColors.black,
        ),
        home: TabBar(),
        title: "IOS",
      );

  }
}
