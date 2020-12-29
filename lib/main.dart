import 'package:d_day_app/screens/detail.dart';
import 'package:d_day_app/screens/home.dart';
import 'package:d_day_app/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'D-Day Application',
    initialRoute: "/",
    theme: ThemeData(
      fontFamily: 'NanumBarunpen',
    ),
    routes: {
      "/": (context) => HomePage(),
      "/register": (context) => RegisterPage(),
      "/detail": (context) => DetailPage(),
    },
  ));
}
