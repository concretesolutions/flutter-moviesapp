import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/model/Movie.dart';
import 'package:moviesapp/utils/ImageURLBuilder.dart';
import 'package:moviesapp/storage/FavoriteStorage.dart';

class MovieCard extends StatefulWidget {
  final Movie _movie;

  MovieCard(this._movie);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Image _movieCoverImage;
  Color _iconColor = Colors.black54;
  Movie movie;

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
  }

  Widget _cardContent() {
    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [
          _cardImageContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(children: [_cardMovieTitle(), _favoriteButton()]),
          )
        ],
      ),
    );
  }

  Widget _cardImageContainer() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_movieCoverImage]);
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
      icon: Icon(CupertinoIcons.heart_fill, color: _iconColor),
      onPressed: () {
        _selectedFavoriteButtonState();
      },
    ));
  }

  void _selectedFavoriteButtonState() {
    final favoriteStorage = FavoriteStorage();
    setState(() {
      if (favoriteStorage.isFavoriteMovie(movie.id)) {
        _iconColor = Colors.black54;
        favoriteStorage.unfavoriteMovie(movie.id);
      } else {
        _iconColor = Colors.red;
        favoriteStorage.favoriteMovie(movie);

      }
    });
  }

  void _cardImageDownload() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final posterURL = ImageURLBuilder.build(widget._movie.poster);
    final image = Image.network(
      posterURL,
      width: queryData.size.width,
      fit: BoxFit.fill,
    );

    image.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((info, call) {
      if (mounted) {
        animationController.forward();
        setState(() {
          _movieCoverImage = image;
        });
      }
    }));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
