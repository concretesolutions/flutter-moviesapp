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
    return Card(
      color: Colors.deepPurple, 
      child: movieContent(),
    );
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
    return Image.network(widget._movie);
  }

  Widget movieTitle() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Center(
          child: Text(
            "TYhor",
            maxLines: 2, 
            style: TextStyle(
              color: CupertinoColors.systemYellow), 
            textAlign: TextAlign.center,
          )
        ),
      ),
    );
  }
}
