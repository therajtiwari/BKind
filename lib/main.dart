import 'dart:ui' as ui;

import 'package:bkind/screens/login.dart';
import 'package:bkind/screens/profile.dart';
import 'package:bkind/screens/register.dart';
import 'package:bkind/screens/settings.dart';
import 'package:bkind/screens/welcome_screen.dart';
import 'package:bkind/screens/login_signup.dart';
import 'package:bkind/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = ui.window.physicalSize.width;
    return MaterialApp(
      title: 'BKind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorWhite,
        // accentColor: colorDarkBlues,
        textTheme: screenWidth < 500 ? textThemeSmall : textThemeDefault,
      ),
      home: const Login(),
    );
  }
}
