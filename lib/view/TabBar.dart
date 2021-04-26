import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../favoritesList/view/FavoritesPage.dart';
import '../moviesList/view/MoviesPage.dart';
import '../moviesList/viewModel/MoviesListViewModel.dart';
import '../storage/FavoriteStorage.dart';
import '../utils/ImageDownloader.dart';
import '../utils/widgetsKeys.dart';

class TabBar extends StatefulWidget {
  const TabBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  final _moviesPage = ChangeNotifierProvider(
      create: (context) => MoviesListViewModel(),
      child: MoviesPage(ImageDownloader()));

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet, key: WidgetKeys.listTab()), label: "Movies"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart, key: WidgetKeys.favoriteTab()), label: "Favorites")
        ],
      ),
      tabBuilder: (context, i) {
        switch (i) {
          case 0:
            return _moviesPage;
          case 1:
            return FavoritesPage(ImageDownloader(), FavoriteStorage());
          default:
            return Text("No widget provided for that tab");
        }
      },
    );
  }
}
