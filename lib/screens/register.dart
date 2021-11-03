import 'package:flutter/material.dart';
import '../utils/widget_functions.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(children: [
      Container(
          width: size.width,
          height: size.height,
          child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            addVerticalSpace(height * 0.15),
            const Text(
              'Hi there, Kind Person',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            addVerticalSpace(height * 0.05),
            const Text(
              'Register to continue',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: 'Preffered Language',
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: 'Other Language',
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: 'Free Time',
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
              ],
            )
          ])))
    ]));
  }
}
