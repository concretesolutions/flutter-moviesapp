import 'package:flutter/widgets.dart';

class WidgetKeys {
  
  static Key favoritedFilmTitle(int index) => Key('FavoritedFilmTitle${index}');
  static Key emptyFilms() => Key('EmptyFilms');
  static Key favoriteIcon(int index) => Key('favoriteIcon${index}');
  static Key listTab() => Key('listTab');
  static Key favoriteTab() => Key('favoriteTab');

}