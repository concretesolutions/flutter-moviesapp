import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../driverRobot.dart';

class FavoriteFlowRobot extends DriverRobot {

  SerializableFinder favoriteTab = find.byValueKey('favoriteTab');
  SerializableFinder listTab = find.byValueKey('listTab');
  SerializableFinder favoriteFilmIcon = find.byValueKey('favoriteIcon0');
  SerializableFinder favoritedFilmTitle = find.byValueKey('FavoritedFilmTitle0');
  SerializableFinder emptyFilmsText = find.byValueKey("EmptyFilms");

  Future<void> saveFirstFilm() async {
    await driver.runUnsynchronized(() async {
        await driver.tap(favoriteFilmIcon);
    });
  }

  Future<void> unsaveFirstFilm() async {
    await driver.runUnsynchronized(() async {
        await driver.tap(favoriteFilmIcon);
    });
  }


  Future<void> navigateToFavoritesFilms() async {
    await driver.runUnsynchronized(() async {
        await driver.tap(favoriteTab);
    });
  }

  Future<void> navigateToFilmsList() async {
    await driver.runUnsynchronized(() async {
        await driver.tap(listTab);
    });
  }

  void checkForSavedFilm() async {
    expect(await driver.getText(favoritedFilmTitle), isNotEmpty);
  }

  void checkForZeroSavedFilms() async {
    expect(await driver.getText(emptyFilmsText), isNotEmpty);
  }

}