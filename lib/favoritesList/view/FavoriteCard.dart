import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageURLBuilder.dart';

class FavoriteCard extends StatefulWidget {
  final Movie _movie;

  FavoriteCard(this._movie);

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child:
            Container(width: 100, color: Colors.black12, child: _contentRow()));
  }

  Widget _contentRow() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          Flexible(fit: FlexFit.loose, child: _contentColumn())
        ]);
  }

  Widget _contentColumn() {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_titleReleaseRow(), SizedBox(height: 8), _overview()]));
  }

  Widget _titleReleaseRow() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(), Spacer(), _release()]);
  }

  Widget _title() {
    return Text(widget._movie.title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
  }

  Widget _release() {
    return Text(widget._movie.releaseDate,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal));
  }

  Widget _overview() {
    return Text(widget._movie.overview,
        style: TextStyle(fontSize: 12, color: Colors.black87), maxLines: 4);
  }

  Widget _image() {
    final posterURL = ImageURLBuilder.build(widget._movie.poster);
    return Image.network(posterURL, height: 100);
  }
}
