class DDay {
  final int id;
  final String title;
  final String datetime;
  final String type;

  DDay(this.id, this.title, this.datetime, this.type);
}

enum DDayType { DEFAULT, LOVE, SOLDIER, STUDY }
