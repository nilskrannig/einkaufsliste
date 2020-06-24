import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/models/item.dart';
import 'package:einkaufsliste/models/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _taskName;

    return Container(
      color: kPrimaryColorDimmed,
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kAccentColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kAccentColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kAccentColor),
                ),
              ),
              onChanged: (value) {
                _taskName = value;
              },
            ),
            FlatButton(
              color: kAccentColor,
              textColor: Colors.white,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(
                  Task(name: _taskName),
                );
                Navigator.pop(context);
              },
              child: Text(
                'Add',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
