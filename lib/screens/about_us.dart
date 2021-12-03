import 'package:bkind/models/user_model.dart';
import 'package:bkind/screens/home_blind.dart';
import 'package:bkind/screens/home_volunteer.dart';
import 'package:bkind/screens/login.dart';
import 'package:bkind/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "../utils/constants.dart";

// void main() => runApp(MyApp());

class AboutUs extends StatefulWidget {
  UserModel? loggedInUser;

  AboutUs(this.loggedInUser, {Key? key}) : super(key: key);
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final double circleRadius = 120.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About us',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
                    'Hello ${widget.loggedInUser?.name ?? 'Guest'}',
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
                              builder: (context) => widget.loggedInUser!.isVol
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
                            builder: (context) => widget.loggedInUser!.isVol
                                ? const HomeVolunteer()
                                : const HomeBlind()));
                  }),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AboutUs(widget.loggedInUser)));
                  },
                  icon: const Icon(Icons.info),
                ),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutUs(widget.loggedInUser)));
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
        appBar: AppBar(
          title: const Text('About Us'),
          backgroundColor: colorDarkBlue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "bKind",
                        style: TextStyle(
                          fontSize: 40,
                          shadows: [
                            Shadow(color: colorDarkBlue, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: colorDarkBlue,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "The mission of bKind is to make the world more accessible to persons who are blind or have impaired vision.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "As a blind or low-vision individual, our volunteers are pleased to assist you whenever you want visual support. You and a volunteer may connect immediately and solve a problem via a live video conversation. The volunteer will assist you in determining which way to position your camera, what to focus on. The volunteer will also assist you in navigating the places and will help you find the right place to go.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text(
                    "Developers",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: circleRadius / 2.0,
                            ),
                            child: Container(
                              height: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8.0,
                                    offset: Offset(0.0, 5.0),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: circleRadius / 2,
                                    ),
                                    const Text(
                                      'Apurv Kulkarni',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34.0),
                                    ),
                                    const Text(
                                      '1914098',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: colorDarkBlue),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///Image Avatar
                          Container(
                            width: circleRadius,
                            height: circleRadius,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8.0,
                                  offset: Offset(0.0, 5.0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                // child: Container(
                                //   child: Icon(Icons.person),
                                //   // CircularAvatar

                                //   /// replace your image with the Icon
                                // ),
                                child: ClipOval(
                                  child: Image.network(
                                      'https://media-exp1.licdn.com/dms/image/C4D03AQEDmA5FMNecLA/profile-displayphoto-shrink_800_800/0/1632377872259?e=1643846400&v=beta&t=WFiEtrZXLSRmtzea9XJxEtC3Nfk8q_9Uis3oi2Mrl1Q'),

                                  /// replace your image with the Icon
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  // height: double.infinity,
                  width: double.infinity,
                  // color: Color(0xffE0E0E0),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: circleRadius / 2.0,
                              ),
                              child: Container(
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8.0,
                                      offset: Offset(0.0, 5.0),
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: circleRadius / 2,
                                      ),
                                      const Text(
                                        'Trigya Roy',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 34.0),
                                      ),
                                      const Text(
                                        '1914114',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: colorDarkBlue),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            ///Image Avatar
                            Container(
                              width: circleRadius,
                              height: circleRadius,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8.0,
                                    offset: Offset(0.0, 5.0),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Container(
                                   
                                    child: ClipOval(
                                    child: Image.network(
                                        'https://media-exp1.licdn.com/dms/image/C4E03AQEWT2QxqNNvcw/profile-displayphoto-shrink_800_800/0/1638479641705?e=1643846400&v=beta&t=eiz6Z01zVuF_39sc19Et7oRh03aShFs5qhHlHA02emE'),


                                    /// replace your image with the Icon
                                  ),
                                  // child: ClipOval(
                                  //   child: Image.network(
                                  //       'https://media-exp1.licdn.com/dms/image/C4D03AQEDmA5FMNecLA/profile-displayphoto-shrink_800_800/0/1632377872259?e=1643846400&v=beta&t=WFiEtrZXLSRmtzea9XJxEtC3Nfk8q_9Uis3oi2Mrl1Q'),

                                  //   /// replace your image with the Icon
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // height: double.infinity,
                  width: double.infinity,
                  // color: Color(0xffE0E0E0),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: circleRadius / 2.0,
                              ),

                              ///here we create space for the circle avatar to get ut of the box

                              child: Container(
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8.0,
                                      offset: Offset(0.0, 5.0),
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: circleRadius / 2,
                                      ),
                                      const Text(
                                        'Raj Tiwari',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 34.0),
                                      ),
                                      const Text(
                                        '1914127',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: colorDarkBlue),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            ///Image Avatar
                            Container(
                              width: circleRadius,
                              height: circleRadius,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8.0,
                                    offset: Offset(0.0, 5.0),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  // child: Container(
                                  //   child: Icon(Icons.person),

                                  //   /// replace your image with the Icon
                                  // ),
                                  child: ClipOval(
                                    child: Image.network(
                                        'https://media-exp1.licdn.com/dms/image/C5603AQHzATutK5gCWg/profile-displayphoto-shrink_200_200/0/1593624246764?e=1643846400&v=beta&t=Q4hMPGEtbF2OhJ9Ixdx_H0ypqe0tce092NqmdTHY1dE'),

                                    /// replace your image with the Icon
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
