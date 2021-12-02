import 'package:bkind/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('bKind'),
          backgroundColor: colorDarkBlue,
        ), //AppBar
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(
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
                child: const Text('Call first available user'),
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
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.dialpad_outlined),
              // alignment: Center,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        )),
      ),
    );
  }
}
