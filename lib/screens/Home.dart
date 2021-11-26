import 'package:bkind/utils/constants.dart';
import 'package:flutter/material.dart';

// void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('bKind'),
          backgroundColor: colorDarkBlue,
        ), //AppBar
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                left: 7.0,
                right: 7.0,
                top: 50.0,
                bottom: 10.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 450),
                  primary: colorBlue2,
                ),
                child: Text('Call first available user'),
                onPressed: () {},
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.dialpad_outlined),
              // alignment: Center,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        )),
      ),
    );
  }
}
