import 'package:flutter/material.dart';

const colorBlack = Color.fromRGBO(48, 47, 48, 1.0);
const colorDarkBlue = Color.fromRGBO(0, 38, 130, 1.0);
const colorBlue1 = Color.fromRGBO(195, 224, 229, 1.0);
const colorBlue2 = Color.fromRGBO(39, 68, 114, 1.0);
const colorBlue3 = Color.fromRGBO(88, 133, 175, 1.0);
const colorBlue4 = Color.fromRGBO(65, 114, 159, 1.0);
const colorBlue5 = Color.fromRGBO(5, 92, 157, 1.0);

const colorGrey = Color.fromRGBO(141, 141, 141, 1.0);
const colorWhite = Colors.white;

const TextTheme textThemeDefault = TextTheme(
    headline1:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 26),
    headline2:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline3:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline4:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 16),
    headline5:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline6:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: colorBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: colorGrey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1:
        TextStyle(color: colorBlack, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2:
        TextStyle(color: colorGrey, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme textThemeSmall = TextTheme(
    headline1:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline2:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline3:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 18),
    headline4:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline5:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    headline6:
        TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: colorBlack,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: colorGrey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1:
        TextStyle(color: colorBlack, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2:
        TextStyle(color: colorGrey, fontSize: 10, fontWeight: FontWeight.w400));
