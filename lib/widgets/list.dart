import "package:flutter/material.dart";

// List View Builder
class ListViewBuilder extends StatelessWidget {
  final List<Widget> entries;
  final List<Color> colorCodes;
  final double padding;

  ListViewBuilder(this.entries, {this.colorCodes, this.padding: 40.0});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
  }
}

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
