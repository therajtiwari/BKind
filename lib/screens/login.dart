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
        margin: EdgeInsets.symmetric(horizontal: width * 0.08),
        width: size.width,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(height * 0.15),
              const Text(
                'Welcome Back Kind Person',
                textAlign: TextAlign.center,
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
                    margin: const EdgeInsets.all(20),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const TextField(
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
                      style: const ButtonStyle(
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
                  addVerticalSpace(height * 0.02),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/auth/register");
                    },
                    child: const Text("Register"),
                  ),
                ],  
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
