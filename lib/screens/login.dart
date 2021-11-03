import 'package:flutter/material.dart';
import '../utils/widget_functions.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(height * 0.15),
              const Text(
                'Welcome Back Kind Person',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              addVerticalSpace(height * 0.05),
              const Text(
                'Sign in to continue',
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
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: ElevatedButton(
                      // style: style,
                      style: ButtonStyle(
                          // backgroundColor:,

                          ),
                      onPressed: () {},
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Register',
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
