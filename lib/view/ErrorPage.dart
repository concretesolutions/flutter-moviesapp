import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback callback;

  ErrorPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.fromLTRB(50, 12, 50, 0),
      child: Column(children: [
        Icon(CupertinoIcons.xmark_circle, color: Colors.black, size: 180),
        Text(
          "Error!",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Text(
          "Something went wrong! Please try again.",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        SizedBox(height: 40),
        CupertinoButton(
            borderRadius: new BorderRadius.circular(30.0),
            color: Colors.black,
            child: Text("Try again", style: TextStyle(fontSize: 16, color: Colors.amber)),
            onPressed: callback),
        Spacer()
      ]),
    ));
  }
}
