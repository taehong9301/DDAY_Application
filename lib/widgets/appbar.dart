import "package:flutter/material.dart";

Widget HomeAppBar() => AppBar(
      title: Text(
        "디데이",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      elevation: 0.0,
      centerTitle: true,
    );
