

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback callback;

  ErrorPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(50),
      child: Column(children: [
        Spacer(),
        Icon(CupertinoIcons.xmark_circle_fill, color: Colors.red, size: 200),
        SizedBox(height: 40),
        Text("Something went wrong! Please try again. :) ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
        SizedBox(height: 40),
        CupertinoButton(
          color: Colors.deepPurple,
            child: Text("Try again", style: TextStyle(fontSize: 24)),
            onPressed: callback),
        Spacer()
      ]),
    ));
  }
}
