import 'package:flutter/cupertino.dart';
import 'Movies.dart';
import 'Favorites.dart';

class TabBar extends StatefulWidget {
  TabBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {

  List<Widget> tabs = [
    Movies(),
    Favorites(),
  ];

  @override
  Widget build(BuildContext context) {
    // if (isIos) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: "Movies" ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Favorites")
          ],
        ),
        tabBuilder: (context, i) {
          switch (i) {
            case 0:
              return Movies();
              break;
            case 1:
              return Favorites();
              break;
            default:
              return Movies();
          }
        },
      );
  }
}
