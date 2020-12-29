import 'package:date_format/date_format.dart';
import "package:flutter/material.dart";

class RegisterBottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '디데이 제목',
            ),
            autofocus: true,
          ),
          DatePickerButton(),
        ],
      ),
    );
  }
}

class DatePickerButton extends StatefulWidget {
  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime _datetime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            _datetime == null
                ? "기념일을 선택해주세요."
                : formatDate(_datetime, [yyyy, "년 ", mm, "월 ", dd, "일"]),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 32,
          height: 32,
          child: Icon(
            Icons.date_range,
            size: 40,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment(-1.0, -2.0),
              end: Alignment(1.0, 2.0),
              colors: [Colors.purpleAccent[100], Colors.deepPurple],
            ),
          ),
        ),
      ],
    );
  }
}

// onPressed: () {
// showDatePicker(
// helpText: "기념일을 선택해주세요.",
// confirmText: "설정 완료",
// cancelText: "취소",
// fieldHintText: "기념일을 선택해주세요.",
// fieldLabelText: "월/일/연도 순으로 작성해주세요.",
// context: context,
// initialDate: _datetime == null ? DateTime.now() : _datetime,
// firstDate: DateTime(1000),
// lastDate: DateTime(2999),
// ).then((date) => setState(() {
// _datetime = date;
// }));
// },
