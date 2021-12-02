import 'package:flutter/material.dart';

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
        appBar: AppBar(title: Text('About us')),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xffE0E0E0),
          child: Stack(children: <Widget>[
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
                      height: 300.0,
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
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                                    color: Colors.lightBlueAccent),
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
                          )),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
