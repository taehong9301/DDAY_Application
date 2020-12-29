import 'package:d_day_app/screens/detail.dart';
import 'package:d_day_app/screens/home.dart';
import 'package:d_day_app/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'D-Day Application',
    initialRoute: "/",
    theme: ThemeData(
      fontFamily: 'Spoqa Han Sans',
    ),
    routes: {
      HomePage.routeName: (context) => HomePage(),
      RegisterPage.routeName: (context) => RegisterPage(),
      DetailPage.routeName: (context) => DetailPage(),
    },
  ));
}
