import 'package:flutter/cupertino.dart';
import 'package:moviesapp/view/TabBar.dart';


void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        barBackgroundColor: CupertinoColors.systemYellow,
        primaryColor: CupertinoColors.black,
      ),
      home: TabBar(),
    );
  }
}
