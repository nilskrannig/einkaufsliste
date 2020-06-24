class Item {
  String name;
  bool isDone;

  Item({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
