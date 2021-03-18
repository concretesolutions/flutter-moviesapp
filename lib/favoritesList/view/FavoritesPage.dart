import 'package:flutter/cupertino.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemYellow,
          middle: const Text("Favorites")),
      child: Center(
        child: Text("FavoritesPage"),
      ),
    );
  }
}
