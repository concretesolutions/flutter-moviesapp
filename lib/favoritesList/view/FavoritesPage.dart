import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../moviesList/model/Movie.dart';
import '../../storage/FavoriteStorageProtocol.dart';
import '../../utils/ImageDownloader.dart';
import '../../utils/widgetsKeys.dart';
import 'FavoriteCard.dart';

class FavoritesPage extends StatefulWidget {
  final ImageDownloader _downloader;
  final FavoriteStorageProtocol _storage;

  const FavoritesPage(this._downloader, this._storage);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemYellow,
          middle: const Text("Favorites")),
      child: _content(),
    );
  }

  Widget _content() {
    List<Movie> movies = widget._storage.getFavoritesMovies();
    if (movies.isEmpty) {
      return _emptyState();
    } else {
      return _list(movies);
    }
  }

  Widget _list(List<Movie> movies) {
    return Center(
      child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: FavoriteCard(movies[index], widget._downloader, index));
          }),
    );
  }

  Widget _emptyState() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Text(
                "You don't have any favorite movies yet. You can favorite in the list.", key: WidgetKeys.emptyFilms(), textAlign: TextAlign.center)));
  }
}
