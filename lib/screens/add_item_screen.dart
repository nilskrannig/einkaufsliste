import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/models/item.dart';
import 'package:einkaufsliste/models/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _itemName;

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
              'Add Item',
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
                _itemName = value;
              },
            ),
            FlatButton(
              color: kAccentColor,
              textColor: Colors.white,
              onPressed: () {
                Provider.of<ItemData>(context, listen: false).addItem(
                  Item(name: _itemName),
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
