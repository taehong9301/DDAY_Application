import 'package:d_day_app/models/dday.dart';
import 'package:d_day_app/repositories/database_helper.dart';
import 'package:d_day_app/screens/detail.dart';
import 'package:d_day_app/screens/register.dart';
import 'package:d_day_app/utils/data_controller.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import 'button.dart';

class DDayListView extends StatefulWidget {
  @override
  _DDayListViewState createState() => _DDayListViewState();
}

class _DDayListViewState extends State<DDayListView> {
  List<Widget> entries = List();

  List<Widget> findAll() {
    List<Widget> list = List();

    DatabaseHelper.instance.findAll().then(
          (rows) => setState(
            () {
              if (rows.length != 0) {
                var data = rows.map((row) => getCard(DDay(
                    row["id"], row["title"], row["datetime"], row["type"])));
                for (Widget w in data) {
                  list.add(w);
                }
              }
              list.add(RegisterButton());
            },
          ),
        );

    return list;
  }

  @override
  void initState() {
    // DB 로 부터 전체 데이터를 불러옴
    setState(() {
      entries = findAll();
    });
  }

  getCard(DDay dDay) {
    return Builder(
      builder: (context) {
        return Slidable(
          delegate: SlidableDrawerDelegate(),
          actionExtentRatio: 0.25,
          child: Container(
            height: 80.0,
            color: Colors.white,
            // 보여줄 ListTile 정의
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: getCircleAvatarByType(type: dDay.type),
                    title: Text(
                      dDay.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      dDay.datetime,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    getDDayMessageByType(dDay.datetime, type: dDay.type),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new IconSlideAction(
              caption: '상세보기',
              color: Colors.blue[500],
              icon: Icons.more_horiz,
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName,
                    arguments: dDay);
              },
            ),
          ],
          secondaryActions: <Widget>[
            new IconSlideAction(
              caption: '수정',
              color: Colors.green[500],
              icon: Icons.edit,
              onTap: () {
                Navigator.pushNamed(context, RegisterPage.routeName,
                    arguments: dDay);
              },
            ),
            new IconSlideAction(
              caption: '삭제',
              color: Colors.red[500],
              icon: Icons.delete,
              onTap: () {
                Dialogs.materialDialog(
                  msg: "'${dDay.title}'을 삭제하실건가요?",
                  title: "삭제 안내",
                  color: Colors.white,
                  context: context,
                  actions: [
                    IconsOutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "취소",
                      iconData: Icons.cancel_outlined,
                      textStyle: TextStyle(color: Colors.grey),
                      iconColor: Colors.grey,
                    ),
                    IconsButton(
                      onPressed: () {
                        DatabaseHelper.instance.delete(dDay.id).then((result) {
                          if (result != 0) {
                            setState(() {
                              entries = findAll();
                            });
                            // _showSnackBar(context, '삭제 완료!');
                          } else {
                            // _showSnackBar(context, "오류가 발생하여 삭제하지 못했습니다.");
                          }
                        });
                        Navigator.pop(context);
                      },
                      text: "삭제",
                      iconData: Icons.delete,
                      color: Colors.red,
                      textStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
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
