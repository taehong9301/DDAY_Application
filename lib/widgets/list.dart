import "package:flutter/material.dart";

class DDayListView extends StatelessWidget {
  final List<Widget> entries;

  DDayListView(this.entries);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Card(
            elevation: 3,
            child: entries[index],
          ),
        );
      },
    );
  }
}

class DDayCard extends StatelessWidget {
  final String title;
  final String days;

  DDayCard(this.title, this.days);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/detail");
      },
      color: Colors.white,
      padding: EdgeInsets.all(35.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Text(title),
              flex: 1,
            ),
            Text(
              days,
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
