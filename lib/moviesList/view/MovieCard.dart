import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageDownloader.dart';
import 'package:moviesapp/moviesList/viewModel/MovieCardViewModel.dart';

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
  Color _iconColor = Colors.black54;
  MovieCardViewModel _viewModel;

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

    _viewModel.getItemColor();
    return Center(
        child: IconButton(
          icon: Icon(CupertinoIcons.heart_fill, color: _iconColor),
          onPressed: () {
            setState(() {
              _viewModel.favoriteButtonState(widget._movie);
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
