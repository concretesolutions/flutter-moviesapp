import 'package:flutter/cupertino.dart';
import 'MoviesPage.dart';
import 'FavoritesPage.dart';

class TabBar extends StatefulWidget {
  TabBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  List<Widget> tabs = [
    MoviesPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet), label: "Movies"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Favorites")
        ],
      ),
      tabBuilder: (context, i) {
        switch (i) {
          case 0:
            return tabs[i];
          case 1:
            return tabs[i];
          default:
            return tabs[i];
        }
      },
    );
  }
}
