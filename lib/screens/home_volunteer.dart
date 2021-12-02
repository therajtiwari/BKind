import 'package:bkind/models/user_model.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/screens/callscreens/pickup/pickup_layout.dart';
import 'package:bkind/screens/home_blind.dart';
import 'package:bkind/screens/login.dart';
import 'package:bkind/screens/profile.dart';
import 'package:bkind/screens/about_us.dart';
import 'package:bkind/utils/call_utilis.dart';
import 'package:bkind/utils/constants.dart';
import 'package:bkind/utils/permissions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeVolunteer extends StatefulWidget {
  const HomeVolunteer({Key? key}) : super(key: key);

  @override
  _HomeVolunteerState createState() => _HomeVolunteerState();
}

class _HomeVolunteerState extends State<HomeVolunteer> {
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
      isVol: false,
      rating: 5);
  // String totalSize = '0';
  // getTotalUsers() async {
  //   print("inside hereeeeeeeeeeeeeee");
  //   FirebaseFirestore.instance.collection('users').snapshots().map((event) => {
  //         totalSize = event.docs.length.toString(),
  //         print("printing this"),
  //         print(totalSize)
  //       });
  // }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
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
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: PickupLayout(
        scaffold: MaterialApp(
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
                      icon: const Icon(Icons.account_circle),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Welcome to bKind',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 250.0,
                      width: 300.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: colorBlue2,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Image.asset(
                            'assets/earth.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(
                        top: 140.0,
                        // bottom: 10.0,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            primary: colorBlue4,
                          ),
                          child: const Text('Learn how to call'),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
