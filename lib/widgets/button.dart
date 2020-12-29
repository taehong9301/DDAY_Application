import "package:flutter/material.dart";

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
