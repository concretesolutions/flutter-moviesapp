import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moviesapp/moviesList/view/MovieCard.dart';
import 'package:moviesapp/moviesList/viewModel/MoviesListViewModel.dart';
import 'package:moviesapp/network/APIResponse.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

ScrollController _scrollController = new ScrollController();

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
        return Center(child: Text(_viewModel.responseController.message));

      case Status.COMPLETED:
        return _movieGrid();

      default:
        return Center(child: Text("Loading..."));
    }
  }

  GridView _movieGrid() {
    return GridView.builder(
      controller: _scrollController,
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
      return MovieCard(_viewModel.movieForIndex(index));
    } else if (index == moviesCount) {
      _handleNewPage();
      return _loading();
    } else {
      return _loading();
    }
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }

  void _handleNewPage() {
    if (_viewModel.shouldFetchNewPage()) {
      _fetchMovies();
    }
  }
}
