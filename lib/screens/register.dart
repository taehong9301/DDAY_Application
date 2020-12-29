import 'package:d_day_app/widgets/register.bottomcontainer.dart';
import 'package:d_day_app/widgets/register.topcontainer.dart';
import "package:flutter/material.dart";

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RegisterTopContainer(),
            Expanded(
              flex: 1,
              child: RegisterBottomContainer(),
            )
          ],
        ),
      ),
    );
  }
}
