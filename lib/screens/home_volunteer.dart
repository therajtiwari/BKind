import 'package:bkind/models/user_model.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/screens/callscreens/pickup/pickup_layout.dart';
import 'package:bkind/screens/profile.dart';
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
    return PickupLayout(
      scaffold: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('bKind'),
            backgroundColor: colorDarkBlue,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text(
                      "Hello, ${loggedInUser.name}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    // width: 200.0,
                    // height: 100.0,
                    margin: const EdgeInsets.only(
                      // left: 10,
                      top: 5,
                      bottom: 20,
                    ),
                    child: const Text(
                      "Welcome to bKind !",
                      style: TextStyle(fontSize: 20),
                    ),
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
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.dialpad_outlined),
                  // alignment: Center,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
