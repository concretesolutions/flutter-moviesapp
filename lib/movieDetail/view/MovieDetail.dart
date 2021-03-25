import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/movieDetail/viewModel/MovieDetailViewModel.dart';

class MovieDetail extends StatefulWidget {
  final MovieDetailViewModel _viewModel;

  MovieDetail(this._viewModel);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget._viewModel.isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(middle: const Text("Movie")),
      child: _body(),
    );
  }

  Widget _body() {
    return Container(padding: EdgeInsets.all(16), child: _detailsContent());
  }

  Widget _detailsContent() {
    return ListView(children: [
      _imageView(),
      SizedBox(height: 16),
      _titleFavoriteRow(),
      _space(),
      _releaseDate(),
      SizedBox(height: 16),
      _overview()
    ]);
  }

  Widget _space() {
    return Container(
      height: 10,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 2.0, color: Colors.red))),
      child: SizedBox(height: 8),
    );
  }

  Widget _imageView() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final image = widget._viewModel.loader.loadCardImage(
        widget._viewModel.movie.poster, queryData.size.width * 0.7);

    return Center(
        child: ClipRRect(borderRadius: BorderRadius.circular(4), child: image));
  }

  Widget _titleFavoriteRow() {
    return Row(
      children: [_cardMovieTitle(), _favoriteButton()],
    );
  }

  Widget _cardMovieTitle() {
    return Flexible(
        fit: FlexFit.tight,
        child: Text(widget._viewModel.movie.title,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18)));
  }

  Widget _favoriteButton() {
    return Flexible(
        fit: FlexFit.loose,
        child: Card(
            child: IconButton(
          icon: Icon(CupertinoIcons.heart_fill,
              color: isFavorited ? Colors.red : Colors.black54),
          onPressed: () {
            widget._viewModel.handleFavoriteSelection();
            setState(
              () {
                isFavorited = !isFavorited;
              },
            );
          },
        )));
  }

  Widget _releaseDate() {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 2.0, color: Colors.purple))),
        padding: EdgeInsets.only(top: 8),
        child: Text(widget._viewModel.movie.releaseDate,
            maxLines: 10, style: TextStyle(fontSize: 18)));
  }

  Widget _overview() {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 2.0, color: Colors.purple))),
        padding: EdgeInsets.only(top: 8),
        child: Text(widget._viewModel.movie.overview,
            maxLines: 10, style: TextStyle(fontSize: 18)));
  }
}
