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
      child: Center(
          child: Text(widget._movie.title,
              maxLines: 2,
              style: TextStyle(color: CupertinoColors.systemYellow),
              textAlign: TextAlign.center)),
    ));
  }

  Widget _cardImage() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final posterURL = ImageURLBuilder.build(widget._movie.poster);
    final _image = Image.network(
      posterURL,
      width: queryData.size.width,
      fit: BoxFit.fill,
    );

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
