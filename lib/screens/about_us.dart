import 'package:flutter/material.dart';
import "../utils/constants.dart";

// void main() => runApp(MyApp());

class AboutUs extends StatelessWidget {
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
        appBar: AppBar(
          title: const Text('About Us'),
          backgroundColor: colorDarkBlue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "The mission of bKind is to make the world more accessible to persons who are blind or have impaired vision. We couldn't have done it without the assistance and dedication of our community.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "As a blind or low-vision individual, our volunteers are pleased to assist you whenever you want visual support. You and a volunteer may connect immediately and solve a problem via a live video conversation. The volunteer will assist you in determining which way to position your camera, what to focus on, and when to switch on your torch.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Developers",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              Container(
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
                                boxShadow: [
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
                                    Text(
                                      'Apurv Kulkarni',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34.0),
                                    ),
                                    Text(
                                      '1914098',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: colorDarkBlue),
                                    ),
                                    SizedBox(
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
                            decoration: BoxDecoration(
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
                              padding: EdgeInsets.all(4.0),
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
              ),
              Container(
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
                                boxShadow: [
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
                                    Text(
                                      'Trigya Roy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34.0),
                                    ),
                                    Text(
                                      '1914114',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: colorDarkBlue),
                                    ),
                                    SizedBox(
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
                            decoration: BoxDecoration(
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
                              padding: EdgeInsets.all(4.0),
                              child: Center(
                                child: Container(
                                  child: Icon(Icons.person),

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
              Container(
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
                                boxShadow: [
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
                                    Text(
                                      'Raj Tiwari',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34.0),
                                    ),
                                    Text(
                                      '1914127',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: colorDarkBlue),
                                    ),
                                    SizedBox(
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
                            decoration: BoxDecoration(
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
                              padding: EdgeInsets.all(4.0),
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
    );
  }
}
