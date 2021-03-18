import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';

class MovieCard extends StatefulWidget {
  final Movie _movie;
  final ImageDownloader _loader;

  MovieCard(this._movie, this._loader);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
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
<<<<<<< HEAD
    if (_movieCoverImage == null) {
      _cardImageDownload();
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: _cardContent(),
      );
    }
=======
    return Stack(
      children: [
        Center(child: CircularProgressIndicator()),
        Center(child: _cardContent()),
      ],
    );
>>>>>>> develop
  }

  Widget _cardContent() {
    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [
          _cardImageContainer(),
          _cardMovieTitle(),
        ],
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
<<<<<<< HEAD
      child: Center(
          child: Text(
        widget._movie.title,
        maxLines: 2,
        style: TextStyle(color: CupertinoColors.systemYellow),
        textAlign: TextAlign.center,
      )),
    ));
=======
          child: Center(
            child: Text(widget._movie.title,
              maxLines: 2,
              style: TextStyle(color: CupertinoColors.systemYellow),
              textAlign: TextAlign.center)
              ),
            )
          );
>>>>>>> develop
  }

  Widget _cardImage() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final _image = widget._loader
        .loadCardImage(widget._movie.poster, queryData.size.width);

    _image.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((info, call) {
<<<<<<< HEAD
      if (mounted) {
        animationController.forward();
        setState(() {
          _movieCoverImage = image;
        });
      }
=======
      animationController.forward();
>>>>>>> develop
    }));
    return _image;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
