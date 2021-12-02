import 'package:bkind/models/user_model.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/screens/home_blind.dart';
import 'package:bkind/screens/home_volunteer.dart';
import 'package:bkind/screens/update.dart';
import 'package:bkind/screens/about_us.dart';

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
      isVol: false,
      rating: 5);

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
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: colorDarkBlue,
                    ),
                    child: Text(
                      'Hello,  ${loggedInUser.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loggedInUser.isVol
                                  ? const HomeVolunteer()
                                  : const HomeBlind()));
                    },
                    icon: const Icon(Icons.home),
                  ),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => loggedInUser.isVol
                                ? const HomeVolunteer()
                                : const HomeBlind()));
                  },
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    icon: const Icon(Icons.account_circle),
                  ),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUs(loggedInUser)));
                    },
                    icon: const Icon(Icons.info),
                  ),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUs(loggedInUser)));
                  },
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      logout(context);
                    },
                    icon: const Icon(Icons.logout),
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    logout(context);
                  },
                ),

                // ignore: prefer_const_constructors
              ],
            ),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),

                            Text(
                              "Name: ${loggedInUser.name}",
                              style: const TextStyle(
                                fontSize: 20.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            // add a divider
                            const Divider(
                              color: colorDarkBlue,
                              thickness: 1.0,
                              indent: 30,
                              endIndent: 30,
                            ),
                            SizedBox(height: 10.0),

                            Text(
                              "Country: ${loggedInUser.country}",
                              style: const TextStyle(
                                fontSize: 20.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            // add a divider
                            SizedBox(height: 10.0),
                            const Divider(
                              color: colorDarkBlue,
                              thickness: 1.0,
                              indent: 30,
                              endIndent: 30,
                            ),
                            SizedBox(height: 10.0),

                            Text(
                              "Email: ${loggedInUser.email}",
                              style: const TextStyle(
                                fontSize: 20.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            // add a divider
                            const Divider(
                              color: colorDarkBlue,
                              thickness: 1.0,
                              indent: 30,
                              endIndent: 30,
                            ),
                            SizedBox(height: 10.0),

                            Text(
                              "Language: ${loggedInUser.language}",
                              style: const TextStyle(
                                fontSize: 20.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            // add a divider
                            SizedBox(height: 10.0),

                            const Divider(
                              color: colorDarkBlue,
                              thickness: 1.0,
                              indent: 30,
                              endIndent: 30,
                            ),
                            // addVerticalSpace(height * 0.02),
                            // Text('Country: ${loggedInUser.country} '),
                            // addVerticalSpace(height * 0.02),
                            // Text('Email : ${loggedInUser.email}'),
                            // addVerticalSpace(height * 0.02),
                            // Text('Language : ${loggedInUser.language} '),
                            // addVerticalSpace(height * 0.2),
                          ],
                        ),
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
