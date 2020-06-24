import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final bool isChecked;
  final String itemTitle;
  final Function checkboxCallback;
  final Function onLongPress;

  ItemTile(
      {@required this.isChecked,
      @required this.itemTitle,
      @required this.checkboxCallback,
      @required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        itemTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      onLongPress: onLongPress,
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
