import 'package:bkind/screens/update.dart';
import "package:flutter/material.dart";
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('bKind'),
            backgroundColor: colorDarkBlue,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Update()));
                        print('Edit btn clicked');
                      },
                      icon: const Icon(Icons.edit)),
                  addVerticalSpace(height * 0.02),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/account.png'),
                          radius: 80.0,
                          backgroundColor: Colors.grey,
                        ),
                        addVerticalSpace(height * 0.05),
                        const Text('Riya Joy'),
                        addVerticalSpace(height * 0.02),
                        const Text('Country: India'),
                        addVerticalSpace(height * 0.02),
                        const Text('Email : riya.joy@somaiya.edu'),
                        addVerticalSpace(height * 0.02),
                        const Text('Language : English'),
                        addVerticalSpace(height * 0.2),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          color: colorBlue3,
                          child: MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10.0),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {},
                              child: const Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
