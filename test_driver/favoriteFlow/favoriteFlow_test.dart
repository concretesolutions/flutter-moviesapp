
import 'package:test/test.dart';

import 'favoriteFlowRobot.dart';

void main() {

  group("Favorite Flow -", () {

    FavoriteFlowRobot robot = FavoriteFlowRobot();

    setUpAll(() async {
      await robot.connect();
    });

    tearDownAll(() async {
      await robot.disconnect();
    });

    test("save and remove film", () async {
      await robot.checkDriverHealth();

      await robot.saveFirstFilm();
      await robot.navigateToFavoritesFilms();
      await robot.checkForSavedFilm();

      await robot.navigateToFilmsList();
      await robot.unsaveFirstFilm();
      await robot.navigateToFavoritesFilms();
      await robot.checkForZeroSavedFilms();
    });

  });

}