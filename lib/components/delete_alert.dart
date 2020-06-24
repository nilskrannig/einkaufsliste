import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/models/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alle Einträge löschen?'),
      actions: [
        FlatButton(
          color: kPrimaryColorDark,
          textColor: Colors.white,
          child: Text('löschen'),
          onPressed: () {
            Provider.of<ItemData>(context, listen: false).removeAllItems();
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          color: kAccentColor,
          textColor: Colors.white,
          child: Text('Nein'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
