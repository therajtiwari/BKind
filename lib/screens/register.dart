import 'package:flutter/material.dart';
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Preffered Language',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Other Language',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.only(top: 20),
                    margin: const EdgeInsets.only(top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Free Time',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  addVerticalSpace(30),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: colorDarkBlue,
                        onPrimary: Colors.white,
                        // minimumSize: const Size(350, 50),
                        minimumSize: const Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ), //////// HERE
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'auth/auth/post');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(20),

                  // padding: const EdgeInsets.only(right: 20.0),
                  SizedBox(
                    // add margin

                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/auth/register");
                      },
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  addVerticalSpace(30),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
