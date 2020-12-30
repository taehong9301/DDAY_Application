import 'package:d_day_app/models/dday.dart';
import 'package:d_day_app/repositories/database_helper.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'home.dart';

String _type = DDayType.DEFAULT.toString();
String _datetime = DateTime.now().format("yyyy-MM-dd", 'ko_KR');

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          FlatButton(
              onPressed: () {
                Map<String, dynamic> data = {
                  "type": _type,
                  "title": "연애",
                  "datetime": _datetime
                };
                DatabaseHelper.instance.insert(data).then((result) =>
                    result != 0
                        ? Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.routeName, (r) => false)
                        : null);
              },
              child: Text("저장")),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TypeSelector(),
              Column(
                children: [
                  DatetimeForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeSelector extends StatefulWidget {
  @override
  _TypeSelectorState createState() => _TypeSelectorState();
}

class _TypeSelectorState extends State<TypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RaisedButton(
            onPressed: () {
              setState(() {
                _type = DDayType.DEFAULT.toString();
              });
            },
            color: _type == DDayType.DEFAULT.toString()
                ? Colors.pink[100]
                : Colors.grey[200],
            child: Text("기본"),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _type = DDayType.LOVE.toString();
              });
            },
            color: _type == DDayType.LOVE.toString()
                ? Colors.pink[100]
                : Colors.grey[200],
            child: Text("연애"),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _type = DDayType.SOLDIER.toString();
              });
            },
            color: _type == DDayType.SOLDIER.toString()
                ? Colors.pink[100]
                : Colors.grey[200],
            child: Text("전역일"),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _type = DDayType.STUDY.toString();
              });
            },
            color: _type == DDayType.STUDY.toString()
                ? Colors.pink[100]
                : Colors.grey[200],
            child: Text("수능"),
          ),
        ],
      ),
    );
  }
}

class DatetimeForm extends StatefulWidget {
  @override
  _DatetimeFormState createState() => _DatetimeFormState();
}

class _DatetimeFormState extends State<DatetimeForm> {
  final String DATE_PATTERN = "yyyy-MM-dd";
  final String DATE_LOCALE = "ko_KR";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        minimumYear: DateTime.now().subYears(100).year,
        maximumYear: DateTime.now().addYears(100).year,
        maximumDate: Date.parse(
          DateTime.now().addYears(100).format(DATE_PATTERN, DATE_LOCALE),
          pattern: DATE_PATTERN,
          locale: DATE_LOCALE,
        ),
        initialDateTime: Date.parse(
          _datetime,
          pattern: DATE_PATTERN,
          locale: DATE_LOCALE,
        ),
        onDateTimeChanged: (datetime) => {
          setState(() {
            _datetime = datetime.format(DATE_PATTERN, DATE_LOCALE);
          })
        },
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
