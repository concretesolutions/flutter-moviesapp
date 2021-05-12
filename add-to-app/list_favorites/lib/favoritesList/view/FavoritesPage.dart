import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:list_favorites/favoritesList/FavoritesViewModel/APIResponse.dart';
import 'package:list_favorites/favoritesList/FavoritesViewModel/FavoriteViewModel.dart';
import 'package:provider/provider.dart';

import '../../moviesList/model/Movie.dart';
import '../../storage/FavoriteStorageProtocol.dart';
import '../../utils/ImageDownloader.dart';
import 'FavoriteCard.dart';

class FavoritesPage extends StatefulWidget {
  final ImageDownloader _downloader;
  final FavoriteStorageProtocol _storage;

  const FavoritesPage(this._downloader, this._storage);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoriteViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<FavoriteViewModel>(context);

    return CupertinoPageScaffold(
      child: _body(),
    );
  }

  void _fetchMovies() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchMovies();
    });
  }

  Widget _body() {
    switch (_viewModel.responseController.status) {
      case Status.LOADING:
        return _emptyState();

      case Status.ERROR:
        return _emptyState();

      case Status.COMPLETED:
        List<Movie> movies = _viewModel.responseController.data;
        if (movies.isEmpty) {
          return _emptyState();
        } else {
          return _list(movies);
        }
        return _emptyState();
      default:
        return _emptyState();
    }
  }

  Future<Widget> _content() async {
    List<Movie> movies = await widget._storage.getFavoritesMovies();

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
                child: FavoriteCard(movies[index], widget._downloader));
          }),
    );
  }

  Widget _emptyState() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Text(
                "You don't have any favorite movies yet. You can favorite in the list.",
                textAlign: TextAlign.center)));
  }
}
