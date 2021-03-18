import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';

class MovieCard extends StatefulWidget {
  final Movie _movie;
  final ImageDownloader _loader;
  final bool _isFavorite;
  final Function(Movie) _favoriteSelection;

  MovieCard(
      this._movie, this._loader, this._isFavorite, this._favoriteSelection);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget._isFavorite;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple,
      child: (_cardContentLoading()),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  Widget _cardContentLoading() {
    return Stack(
      children: [
        Center(child: CircularProgressIndicator()),
        Center(child: _cardContent()),
      ],
    );
  }

  Widget _cardContent() {
    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [_cardImageContainer(), _titleFavoriteRow()],
      ),
    );
  }

  Widget _titleFavoriteRow() {
    return Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_cardMovieTitle(), _favoriteButton()]),
      ),
    );
  }

  Widget _cardImageContainer() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_cardImage()]);
  }

  Widget _cardMovieTitle() {
    return Expanded(
        child: Container(
      child: Center(
          child: Text(
        widget._movie.title,
        maxLines: 2,
        style: TextStyle(color: CupertinoColors.systemYellow),
        textAlign: TextAlign.center,
      )),
    ));
  }

  Widget _favoriteButton() {
    return Center(
        child: IconButton(
      icon: Icon(CupertinoIcons.heart_fill,
          color: isFavorited ? Colors.red : Colors.black54),
      onPressed: () {
        widget._favoriteSelection(widget._movie);
        setState(() {
          isFavorited = !isFavorited;
        });
      },
    ));
  }

  Widget _cardImage() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final _image = widget._loader
        .loadCardImage(widget._movie.poster, queryData.size.width);

    _image.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((info, call) {
      animationController.forward();
    }));
    return _image;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
