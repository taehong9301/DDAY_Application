import 'package:d_day_app/models/dday.dart';
import 'package:d_day_app/repositories/database_helper.dart';
import 'package:d_day_app/utils/date_calc.dart';
import "package:flutter/material.dart";

import 'button.dart';

class DDayListView extends StatefulWidget {
  @override
  _DDayListViewState createState() => new _DDayListViewState();
}

class _DDayListViewState extends State<DDayListView> {
  List<Widget> entries = new List();

  _DDayListViewState() {
    DatabaseHelper.instance.findAll().then((rows) => setState(() {
          if (rows.length != 0) {
            var data = rows.map((row) => DDayCard(
                DDay(row["id"], row["title"], row["datetime"], row["type"])));
            for (Widget w in data) {
              entries.add(w);
            }
          }
          entries.add(RegisterButton());
        }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Card(
            elevation: 1,
            child: entries[index],
          ),
        );
      },
    );
  }
}

class DDayCard extends StatelessWidget {
  final DDay dDay;

  DDayCard(this.dDay);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/detail", arguments: dDay);
      },
      color: Colors.white,
      padding: EdgeInsets.all(35.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Text(dDay.title),
              flex: 1,
            ),
            Text(
              getDDayMessage(dDay.datetime, type: dDay.type),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
