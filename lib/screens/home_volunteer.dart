import 'package:bkind/models/user_model.dart';
import 'package:bkind/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// void main() => runApp(Home());

class HomeVolunteer extends StatefulWidget {
  const HomeVolunteer({Key? key}) : super(key: key);
  @override
  State<HomeVolunteer> createState() => _HomeVolunteerState();
}

class _HomeVolunteerState extends State<HomeVolunteer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('bKind'),
          backgroundColor: colorDarkBlue,
        ), //AppBar
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Container(
                //   margin: EdgeInsets.only(
                //     left: 7.0,
                //     top: 25.0,
                //   ),
                //   child: Text(
                //     "Hello user_name"
                //   ),
                // ),
                Container(
                  // width: 200.0,
                  // height: 100.0,

                  child: Text(
                    "Hello ${loggedInUser.name}!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  // width: 200.0,
                  // height: 100.0,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 25,
                  ),
                  child: Text(
                    "Welcome to bKind!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  height: 150.0,
                  width: 300.0,
                  color: Colors.transparent,
                  // margin: EdgeInsets.all(20),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: new Center(
                        child: new Text(
                          "Rounded Corner Rectangle Shape",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.dialpad_outlined),
              // alignment: Center,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        )),
      ),
    );
  }
}
