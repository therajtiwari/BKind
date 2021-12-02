import 'package:bkind/models/user_model.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/screens/callscreens/pickup/pickup_layout.dart';
import 'package:bkind/screens/profile.dart';
import 'package:bkind/utils/call_utilis.dart';
import 'package:bkind/utils/constants.dart';
import 'package:bkind/utils/permissions.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class HomeBlind extends StatefulWidget {
  const HomeBlind({Key? key}) : super(key: key);

  @override
  _HomeBlind createState() => _HomeBlind();
}

class _HomeBlind extends State<HomeBlind> {
  late UserProvider userProvider;
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

  UserModel toCallUser = UserModel(
      country: '',
      email: '',
      language: '',
      name: '',
      pTimeFrom: '',
      pTimeTill: '',
      uid: '',
      userSince: '',
      isVol: false);

  var body;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      print("postngggggggggg");
      userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.refreshUser();
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });

    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: "rajt@gmail.com")
        .get()
        .then((value) {
      toCallUser = UserModel.fromMap(value.docs[0].data());

      print(toCallUser.name);
      setState(() {});
    });
  }

// class HomeBlind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
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
                              builder: (context) => const Profile()));
                    },
                    icon: const Icon(Icons.account_circle),
                  ),
                  title: const Text('Profile'),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      logout(context);
                    },
                    icon: const Icon(Icons.logout),
                  ),
                  title: const Text('Logout'),
                ),

                // ignore: prefer_const_constructors
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                  top: 50.0,
                  bottom: 10.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 450),
                    primary: colorBlue2,
                  ),
                  child: const Text('Call first available user'),
                  onPressed: () async {
                    print("calling");
                    await Permissions.cameraAndMicrophonePermissionsGranted()
                        ? CallUtils.dial(
                            from: loggedInUser,
                            to: toCallUser,
                            context: context)
                        : print("no permission");
                  },
                ),
              ),
            ]),
          ),
          bottomNavigationBar: BottomAppBar(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeBlind()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
            ],
          )),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }
}
