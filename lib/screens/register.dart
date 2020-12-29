import 'package:d_day_app/widgets/button.dart';
import "package:flutter/material.dart";

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RegisterTopContainer(),
          ],
        ),
      ),
    );
  }
}

class RegisterTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        children: [
          CustomBackButton(),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Text(
                '⭐ 기념일을 등록해보세요',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            colors: [Colors.purpleAccent[100], Colors.deepPurple],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
    );
  }
}
