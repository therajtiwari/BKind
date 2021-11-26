import "package:flutter/material.dart";
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('bKind'),
            backgroundColor: colorDarkBlue,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text('Riya Joy'),
                addVerticalSpace(height * 0.02),
                Text('Joined : 25th December,2020'),
                addVerticalSpace(height * 0.02),
                Text('Country: India'),
                addVerticalSpace(height * 0.02),
                Text('Email : riya.joy@somaiya.edu'),
              ],
            ),
          )),
    );
  }
}
