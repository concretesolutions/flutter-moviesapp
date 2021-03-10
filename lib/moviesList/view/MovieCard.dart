import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final String _movie;

  MovieCard(this._movie);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.deepPurple, child: (movieContent()));
  }

  Widget movieContent() {
    return Column(
      children: [
        imageLoader(),
        movieTitle(),
      ],
    );
  }

  Widget imageLoader() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            widget._movie,
            width: queryData.size.width,
            fit: BoxFit.fill,
          ),
        ]);
  }

  Widget movieTitle() {
    return Expanded(
      child: Container(
        child: Center(
            child: Text(
          "Thor",
          maxLines: 2,
          style: TextStyle(color: CupertinoColors.systemYellow),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
