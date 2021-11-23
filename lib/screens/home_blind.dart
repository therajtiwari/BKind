import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('bKind')), //AppBar
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 250.0, bottom: 10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 400), //////// HERE
                ),
                child: Text('Call'),
                onPressed: () {}),
          ),
        ]),
      ),
    );
  }
}
