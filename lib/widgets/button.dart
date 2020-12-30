import 'package:d_day_app/screens/register.dart';
import "package:flutter/material.dart";

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, RegisterPage.routeName);
      },
      padding: EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        height: 80,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            colors: [Colors.purple[100], Colors.blue[100]],
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.close,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
