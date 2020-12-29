import 'package:d_day_app/widgets/button.dart';
import 'package:d_day_app/widgets/list.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "D-DAY",
              style: TextStyle(
                color: Colors.pink[200],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " DIARY",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: DDayListView(
          [
            DDayCard("우리 함께한지", "365일"),
            DDayCard("수능까지", "60일"),
            DDayCard("전역까지", "12일"),
            DDayCard("아버지 생신", "125일"),
            RegisterButton(),
          ],
        ),
      ),
    );
  }
}
