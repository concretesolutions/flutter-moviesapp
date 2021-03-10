import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/moviesList/view/MovieCard.dart';

class MoviesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Movies"),
      ),
      child: Container(margin: EdgeInsets.all(8), child: _movieGrid(),),
    );
  }

  GridView _movieGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 200/330,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 300,



      itemBuilder: (BuildContext context, int index) {
        return MovieCard("https://m.media-amazon.com/images/M/MV5BNGZiMzBkZjMtNjE3Mi00MWNlLWIyYjItYTk3MjY0Yjg5ODZkXkEyXkFqcGdeQXVyNDg4NjY5OTQ@._V1_SX300.jpg");
      },
    );
  }
}
