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

class _MoviesPageState extends State<MoviesPage> {
  MoviesListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchMovies();
    });
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

  Widget _body() {
    switch (_viewModel.responseController.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());

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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 200 / 360,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: _viewModel.moviesCount(),
      itemBuilder: (BuildContext context, int index) {
        return MovieCard(_viewModel.movieForIndex(index));
      },
    );
  }
}
