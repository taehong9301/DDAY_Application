import "package:flutter/material.dart";

Widget RegisterButton(context) => FloatingActionButton(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            colors: [Colors.purpleAccent[100], Colors.deepPurple],
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/register");
      },
    );
