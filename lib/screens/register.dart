import 'package:d_day_app/models/dday.dart';
import 'package:d_day_app/repositories/database_helper.dart';
import 'package:d_day_app/screens/home.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  String _type = DDayType.DEFAULT.toString();

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
                  "datetime": DateTime.now().toString()
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
              TypeSelector(type: _type),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      minimumYear: 1900,
                      maximumYear: DateTime.now().addYears(100).year,
                      initialDateTime: Date.parse(
                          DateTime.now().format("yyyy-MM-dd", 'ko_KR'),
                          pattern: "yyyy-MM-dd",
                          locale: 'ko_KR'),
                      maximumDate: Date.parse(
                          DateTime.now()
                              .addYears(100)
                              .format("yyyy-MM-dd", 'ko_KR'),
                          pattern: "yyyy-MM-dd",
                          locale: 'ko_KR'),
                      onDateTimeChanged: (datetime) =>
                          {print("test $datetime")},
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
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
  String type;
  TypeSelector({Key key, this.type}) : super(key: key);

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
                widget.type = DDayType.DEFAULT.toString();
              });
            },
            color: widget.type == DDayType.DEFAULT.toString()
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
                widget.type = DDayType.LOVE.toString();
              });
            },
            color: widget.type == DDayType.LOVE.toString()
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
                widget.type = DDayType.SOLDIER.toString();
              });
            },
            color: widget.type == DDayType.SOLDIER.toString()
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
                widget.type = DDayType.STUDY.toString();
              });
            },
            color: widget.type == DDayType.STUDY.toString()
                ? Colors.pink[100]
                : Colors.grey[200],
            child: Text("수능"),
          ),
        ],
      ),
    );
  }
}

class RegisterBottomContainer extends StatefulWidget {
  @override
  _RegisterBottomContainerState createState() =>
      _RegisterBottomContainerState();
}

class _RegisterBottomContainerState extends State<RegisterBottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
