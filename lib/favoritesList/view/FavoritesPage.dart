import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
import 'package:moviesapp/favoritesList/view/FavoriteCard.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';
=======
import 'package:moviesapp/moviesList/service/MoviesListService.dart';
>>>>>>> favoritesButton

class FavoritesPage extends StatelessWidget {
  final ImageDownloader _downloader;

  FavoritesPage(this._downloader);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    Movie movie = Movie(
        id: 10,
        title: "Raya and the Last Dragon",
        overview:
            "The best movie you will ever see. This movie deserves an oscar. The best movie you will ever see.",
        poster: "/1UCOF11QCw8kcqvce8LKOO6pimh.jpg",
        releaseDate: "2021");
=======

    int page;
    MoviesListService().fetchMovies(page);
>>>>>>> favoritesButton

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemYellow,
          middle: const Text("Favorites")),
      child: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: FavoriteCard(movie, _downloader));
            }),
      ),
    );
  }
}
