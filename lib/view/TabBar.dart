import 'package:flutter/cupertino.dart';
import 'package:moviesapp/moviesList/viewModel/MoviesListViewModel.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';
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
  final _moviesPage = ChangeNotifierProvider(
      create: (context) => MoviesListViewModel(),
      child: MoviesPage(ImageDownloader()));

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
