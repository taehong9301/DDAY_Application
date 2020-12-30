import 'package:d_day_app/models/dday.dart';
import 'package:d_day_app/repositories/database_helper.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'home.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String datePattern = "yyyy-MM-dd";
  final String locale = "ko_KR";

  String _type = DDayType.DEFAULT.toString();
  String _datetime = DateTime.now().format("yyyy-MM-dd", 'ko_KR');
  TextEditingController textEditingController = TextEditingController();
  FocusNode _titleFocusNode;

  @override
  void initState() {
    super.initState();
    _titleFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    super.dispose();
  }

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
                if (textEditingController.text.length > 20) {
                  return;
                }

                Map<String, dynamic> data = {
                  "type": _type,
                  "title": textEditingController.text,
                  "datetime": _datetime
                };
                DatabaseHelper.instance.insert(data).then((int result) {
                  if (result != 0) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomePage.routeName, (r) => false);
                  } else {}
                });
              },
              child: Text("저장")),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // 키보드 없애기
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom: 20.0),
                  height: 50,
                  color: Colors.grey[100],
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _type = DDayType.DEFAULT.toString();
                          });
                        },
                        child: Text(
                          "기본",
                          style: TextStyle(
                            fontWeight: _type == DDayType.DEFAULT.toString()
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _type = DDayType.LOVE.toString();
                          });
                        },
                        child: Text(
                          "연애",
                          style: TextStyle(
                            fontWeight: _type == DDayType.LOVE.toString()
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _type = DDayType.SOLDIER.toString();
                          });
                        },
                        child: Text(
                          "전역일",
                          style: TextStyle(
                            fontWeight: _type == DDayType.SOLDIER.toString()
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _type = DDayType.STUDY.toString();
                          });
                        },
                        child: Text(
                          "수능",
                          style: TextStyle(
                            fontWeight: _type == DDayType.STUDY.toString()
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onTap: () {
                          FocusScope.of(context).requestFocus(_titleFocusNode);
                        },
                        focusNode: _titleFocusNode,
                        controller: textEditingController,
                        cursorColor: Colors.pink[200],
                        maxLength: 20,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "제목 입력",
                          labelStyle: TextStyle(
                            color: _titleFocusNode.hasFocus
                                ? Colors.pink
                                : Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.message_outlined,
                            color: _titleFocusNode.hasFocus
                                ? Colors.pink[200]
                                : null,
                          ),
                          focusColor: Colors.pink[200],
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20.0),
                          helperText: "20자내로 작성해주세요.",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pink[200],
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                          minimumYear: DateTime.now().subYears(100).year,
                          maximumYear: DateTime.now().addYears(100).year,
                          maximumDate: Date.parse(
                            DateTime.now()
                                .addYears(100)
                                .format(datePattern, locale),
                            pattern: datePattern,
                            locale: locale,
                          ),
                          initialDateTime: Date.parse(
                            _datetime,
                            pattern: datePattern,
                            locale: locale,
                          ),
                          onDateTimeChanged: (datetime) => {
                            setState(() {
                              _datetime = datetime.format(datePattern, locale);
                            })
                          },
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
