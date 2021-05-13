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
  late List<Map<String, dynamic>> _responseNative;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var saveOperation = false;
    //Map<dynamic, dynamic>? responseNative;

    try {
      //var responseSave = await DataPlugin.saveMovie(
      // "Matheuzim", "/dfdf.png", "Guerra no vácuo");
      //saveOperation = responseSave as bool;
      //responseNative = await DataPlugin.getMovies;
      //print(responseNative);
    } on PlatformException {
      // responseNative = null;
    }

    if (!mounted) return;

    setState(() {
      _saveOperation = saveOperation;
      //_responseNative = responseNative;
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
          child: Column(children: [
            //Text("Resultado do Save ${_saveOperation}"),
            //Text("${_responseNative?.keys}"),
            //Text("${_responseNative?.values}"),
          ]),
        ),
      ),
    );
  }
}
