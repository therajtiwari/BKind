import 'package:bkind/models/user_model.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/screens/callscreens/pickup/pickup_layout.dart';
import 'package:bkind/utils/call_utilis.dart';
import 'package:bkind/utils/constants.dart';
import 'package:bkind/utils/permissions.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

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
      isVol: true,
      rating: 5);

  UserModel toCallUser = UserModel(
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

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .where('pTimeFrom',
    //         isGreaterThanOrEqualTo: DateTime.now().hour.toString() +
    //             ":" +
    //             DateTime.now().minute.toString() +
    //             ":" +
    //             DateTime.now().second.toString())
    //     .where('pTimeTill',
    //         isLessThanOrEqualTo: DateTime.now().hour.toString() +
    //             ":" +
    //             DateTime.now().minute.toString() +
    //             ":" +
    //             DateTime.now().second.toString())
    //     .where('pTimeFrom',
    //         isGreaterThanOrEqualTo: DateTime.now().hour.toString() +
    //             ":" +
    //             DateTime.now().minute.toString() +
    //             ":" +
    //             DateTime.now().second.toString())
    //     .where('language', isEqualTo: loggedInUser.language)
    //     .where('rating', isGreaterThanOrEqualTo: 4)
    //     .get()
    //     .then((value) {
    //   toCallUser = UserModel.fromMap(value.docs[0].data());
    // });

    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: "raj254@gmail.com")
        .get()
        .then((value) {
      toCallUser = UserModel.fromMap(value.docs[0].data());
      // print(toCallUser.name);
      setState(() {});
    });
  }

// class HomeBlind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('bKind'),
          backgroundColor: colorDarkBlue,
        ), //AppBar
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
                  // print("calling");
                  await Permissions.cameraAndMicrophonePermissionsGranted()
                      ? CallUtils.dial(
                          from: loggedInUser, to: toCallUser, context: context)
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
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.dialpad_outlined),
              // alignment: Center,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        )),
      ),
    );
  }
}
