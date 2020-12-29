import "package:flutter/material.dart";

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "D-Day Application",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Container(
          child: Text("Hello"),
        ));
  }
}
