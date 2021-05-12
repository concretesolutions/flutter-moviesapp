import 'package:data_plugin/Movie.dart';
import 'package:data_plugin/data_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:list_favorites/favoritesList/FavoritesViewModel/FavoriteViewModel.dart';
import 'package:list_favorites/favoritesList/view/FavoritesPage.dart';
import 'package:list_favorites/storage/FavoriteStorage.dart';
import 'package:list_favorites/utils/ImageDownloader.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _responseNative;
  //late List<String> _titles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      // _responseNative = await DataPlugin.getMovies;
      //print(_responseNative);
    } on PlatformException {
      print("Error in getRealm in main.dart");
    }

    if (!mounted) return;

    setState(() {});
  }
  // FavoritesPage(ImageDownloader(), FavoriteStorage());

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        barBackgroundColor: CupertinoColors.systemYellow,
        primaryColor: CupertinoColors.black,
      ),
      home: ChangeNotifierProvider(
          create: (context) => FavoriteViewModel(),
          child: FavoritesPage(ImageDownloader(), FavoriteStorage())),
    );
  }
}
