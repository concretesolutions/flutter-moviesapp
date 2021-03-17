import 'package:flutter/cupertino.dart';
import 'package:moviesapp/moviesList/viewModel/MoviesListViewModel.dart';
import 'package:moviesapp/utils/ImageLoader.dart';
import 'package:provider/provider.dart';
import '../moviesList/view/MoviesPage.dart';
import '../favoritesList/view/FavoritesPage.dart';

class TabBar extends StatefulWidget {
  TabBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  List<Widget> tabs = [
    ChangeNotifierProvider(
      create: (context) => MoviesListViewModel(),
      child: MoviesPage(ImageLoader()),
    ),
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
        return tabs[i];
      },
    );
  }
}
