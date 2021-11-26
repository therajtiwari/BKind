import "package:flutter/material.dart";
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: colorDarkBlue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addVerticalSpace(height * 0.05),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: colorBlue2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(height * 0.02),
                  Text('Personal Details',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  addVerticalSpace(height * 0.01),
                  Text(
                    'Change Email',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  addVerticalSpace(height * 0.01),
                  Text('Change Password',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            addVerticalSpace(height * 0.05),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
              child: Column(
                children: [
                  Text(
                    'Languages',
                    style: TextStyle(
                        color: colorBlue2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(height * 0.02),
                  Text('Primary Languages',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  addVerticalSpace(height * 0.01),
                  Text(
                    'Other Languages',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Text('Logout'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(colorBlue3),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
