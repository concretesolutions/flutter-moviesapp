import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageURLBuilder.dart';

class MovieCard extends StatefulWidget {
  final Movie _movie;

  MovieCard(this._movie);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool _contentVisible = false;

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.deepPurple, child: (movieContent()));
  }

  Widget movieTitle() {
    return Expanded(
        child: Container(
      child: Center(
          child: Text(widget._movie.title,
              maxLines: 2,
              style: TextStyle(color: CupertinoColors.systemYellow),
              textAlign: TextAlign.center)),
    ));
  }

  Widget content() {
    return AnimatedOpacity(
      opacity: _contentVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Column(
        children: [
          imageLoader(),
          movieTitle(),
        ],
      ),
    );
  }

  Widget movieContent() {
    this._contentVisible = true;
    return Stack(
      children: [
        Center(child: CircularProgressIndicator()),
        Center(child: content()),
      ],
    );
  }

  Widget imageLoader() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    final posterURL = ImageURLBuilder.build(widget._movie.poster);
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            posterURL,
            width: queryData.size.width,
            fit: BoxFit.fill,
          ),
        ]);
  }
}
