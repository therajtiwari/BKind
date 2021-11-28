import 'package:bkind/models/user_model.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/screens/update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../utils/widget_functions.dart';
import "../utils/constants.dart";
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel(
      country: '',
      email: '',
      language: '',
      name: '',
      pTimeFrom: '',
      pTimeTill: '',
      uid: '',
      userSince: '',
      isVol: false);

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

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
                                builder: (context) => Update(loggedInUser)));
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
                        Text(
                          "Hello, ${loggedInUser.name}",
                        ),
                        addVerticalSpace(height * 0.02),
                        Text('Country: ${loggedInUser.country} '),
                        addVerticalSpace(height * 0.02),
                        Text('Email : ${loggedInUser.email}'),
                        addVerticalSpace(height * 0.02),
                        Text('Language : ${loggedInUser.language} '),
                        addVerticalSpace(height * 0.2),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          color: colorBlue3,
                          child: MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10.0),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {
                                logout(context);
                                print('Logout');
                              },
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

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }
}
