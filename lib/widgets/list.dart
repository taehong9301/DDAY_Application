import "package:flutter/material.dart";

// List View Builder
Widget ListViewBuilder(context, entries, {colorCodes, padding: 50.0}) =>
    ListView.builder(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: null != colorCodes ? colorCodes[index] : null,
          child: Card(
            elevation: 3,
            child: DDayCard(context, padding),
          ),
        );
      },
    );

Widget DDayCard(context, padding) => InkWell(
      onTap: () {
        print("Clicked card");
        Navigator.pushNamed(context, "/detail");
      },
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Text("연애!"),
              flex: 1,
            ),
            Text("325일"),
          ],
        ),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
      ),
    );
