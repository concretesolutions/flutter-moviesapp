import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'view/TabBar.dart';

// void main() {
//   runApp(MoviesApp());
// }
//
// class MoviesApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       theme: CupertinoThemeData(
//         barBackgroundColor: CupertinoColors.systemYellow,
//         primaryColor: CupertinoColors.black,
//       ),
//       home: TabBar(),
//     );
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel("com.flutter.moviesapp/moviesapp");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: MaterialButton(
            child: Text("click"),
            onPressed: () {
              Print();
            },
          ),
        ));
  }

  void Print() async {
    String value;
    try {
      value = await platform.invokeMethod("Print");
    } catch (e) {
      print(e);
    }
    print(value);
  }
}