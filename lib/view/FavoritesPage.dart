import 'package:flutter/cupertino.dart';
import 'package:moviesapp/moviesList/service/MoviesListService.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoviesListService().fetchMovies();
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
