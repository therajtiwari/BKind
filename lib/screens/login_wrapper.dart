import 'package:bkind/models/user_model.dart';
import 'package:bkind/screens/home_blind.dart';
import 'package:bkind/screens/home_volunteer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
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
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
      // print("hereee in wrapper");
      // print(loggedInUser.isVol);
      if (loggedInUser.isVol == true) {
        print("volunteer");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeVolunteer()));
      } else {
        print("blind");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeBlind()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return a spinner
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
