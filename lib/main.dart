import 'package:d_day_app/pages/detail.dart';
import 'package:d_day_app/pages/home.dart';
import 'package:d_day_app/pages/register.dart';
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
