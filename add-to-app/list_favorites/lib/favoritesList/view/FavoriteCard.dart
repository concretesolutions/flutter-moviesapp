import 'package:flutter/material.dart';
import '../../moviesList/model/Movie.dart';
import '../../utils/ImageDownloader.dart';

class FavoriteCard extends StatefulWidget {
  final Movie _movie;
  final ImageDownloader _downloader;

  const FavoriteCard(this._movie, this._downloader);

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
        children: [_image(), Flexible(child: _contentColumn())]);
  }

  Widget _contentColumn() {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
            children: [_titleReleaseRow(), SizedBox(height: 8), _overview()]));
  }

  Widget _titleReleaseRow() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Flexible(child: _title(), fit: FlexFit.tight), _release()]);
  }

  Widget _title() {
    return Text(widget._movie.title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        maxLines: 1);
  }

  Widget _release() {
    return Text(widget._movie.releaseDate,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
        maxLines: 1);
  }

  Widget _overview() {
    return Text(widget._movie.overview,
        style: TextStyle(fontSize: 12, color: Colors.black87), maxLines: 4);
  }

  Widget _image() {
    return widget._downloader.loadCardFavoriteImage(widget._movie.poster);
  }
}
