import 'package:d_day_app/models/dday.dart';
import "package:flutter/material.dart";

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final DDay dDay = ModalRoute.of(context).settings.arguments;

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
          child: Text(
              "${dDay.id} / ${dDay.title} / ${dDay.type} / ${dDay.datetime}"),
        ));
  }
}
