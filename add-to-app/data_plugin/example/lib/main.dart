import 'package:data_plugin/Movie.dart';
import 'package:data_plugin/Movies.dart';
import 'package:data_plugin/data_plugin.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

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
  var _saveOperation = false;
  var _movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var saveOperation = false;
    var movies = [];

    try {
      var responseSave = await DataPlugin.saveMovie;
      var responseSaveCast = responseSave as bool;

      if (responseSaveCast == true) {
        saveOperation = true;
        var responseNative = await DataPlugin.getMovies;
        var returnedMovies = responseNative as MovieReturn;
        movies = returnedMovies.listMovies;
        print(movies);
      }
    } on PlatformException {
      movies = [];
    }

    if (!mounted) return;

    setState(() {
      _saveOperation = saveOperation;
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teste do Data Plugin"),
        ),
        body: Center(
          child: Text("Result save operation: ${_saveOperation}"),
        ),
      ),
    );
  }
}
