import 'package:d_day_app/models/dday.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final DDay dDay = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey[700],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.pink[100],
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("header"),
            ),
            SizedBox(
              height: 100.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Container(
                  child: Text("main"),
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
              flex: 1,
            )
          ],
        ),
      )),
    );
  }
}
