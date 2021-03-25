import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moviesapp/movieDetail/view/movieDetail.dart';
import 'package:moviesapp/movieDetail/viewModel/MovieDetailViewModel.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/moviesList/view/MovieCard.dart';
import 'package:moviesapp/moviesList/viewModel/MoviesListViewModel.dart';
import 'package:moviesapp/network/APIResponse.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';
import 'package:moviesapp/view/ErrorPage.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  final ImageDownloader _loader;

  MoviesPage(this._loader);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<MoviesListViewModel>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Movies"),
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        child: _body(),
      ),
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
        return _loading();

      case Status.ERROR:
        return _error();

      case Status.COMPLETED:
        return _movieGrid();

      default:
        return Center(child: Text("Loading..."));
    }
  }

  GridView _movieGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 200 / 360,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: _viewModel.itemsCount(),
      itemBuilder: (BuildContext context, int index) {
        return _itemForIndex(index);
      },
    );
  }

  Widget _itemForIndex(int index) {
    final moviesCount = _viewModel.moviesCount();
    if (index < moviesCount) {
      return _card(index);
    } else if (index == moviesCount) {
      _handleNewPage();
      return _loading();
    } else {
      return _loading();
    }
  }

  Widget _card(int index) {
    final movie = _viewModel.movieForIndex(index);
    final isFavorite = _viewModel.isMovieFavorite(index);
    return GestureDetector(
        onTap: () {
          _selectedMovie(movie, _viewModel.isMovieFavorite(index));
        },
        child: MovieCard(movie, widget._loader, isFavorite, (movie) {
          _viewModel.handleFavoriteSelection(movie);
        }));
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }

  void _handleNewPage() {
    if (_viewModel.shouldFetchNewPage()) {
      _fetchMovies();
    }
  }

  Widget _error() {
    return ErrorPage(() {
      _fetchMovies();
    });
  }

  void _selectedMovie(Movie movie, bool isFavorited) {
    final movieDetailViewModel = MovieDetailViewModel(movie, isFavorited);
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (BuildContext context) =>
                MovieDetail(movieDetailViewModel)));
  }
}
