import 'package:bkind/screens/login_signup.dart';
import 'package:bkind/screens/register.dart';
import 'package:bkind/screens/register_blind.dart';
import "package:flutter/material.dart";
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // print(size);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Center(
              child: Column(
                // addVerticalSpace(100),
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(height: 100),
                  addVerticalSpace(height * 0.1),
                  const Text(
                    'Welcome to bKind',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: colorBlack,
                    ),
                  ),
                  addVerticalSpace(height * 0.05),
                  // add circle avatar
                  Container(
                    width: width * 0.5,
                    height: width * 0.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(height * 0.05),
                  Container(
                    margin: EdgeInsets.all(width * 0.04),
                    child: const Center(
                      // mainAxisAlignment: MainAxisAlignment.center,

                      child: Text(
                        'What you give today, you get tomorrow.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  addVerticalSpace(height * 0.1),

                  // add a button
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: colorDarkBlue,
                        onPrimary: Colors.white,
                        minimumSize: const Size(320, 50), //////// HERE
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterBlind()),
                        );
                      },
                      child: const Text(
                        'I need help',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(15),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: colorDarkBlue,
                        onPrimary: Colors.white,
                        minimumSize: const Size(320, 50), //////// HERE
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, './login_signup.dart');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: const Text(
                        'I am here to help',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
