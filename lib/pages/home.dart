import 'package:d_day_app/widgets/appbar.dart';
import 'package:d_day_app/widgets/button.dart';
import 'package:d_day_app/widgets/list.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
        child: Center(
            child: ListViewBuilder(
          context,
          [Text("test12"), Text("test2")],
        )),
      ),
      floatingActionButton: RegisterButton(context),
    );
  }
}
