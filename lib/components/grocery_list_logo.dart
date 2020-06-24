import 'package:einkaufsliste/constants.dart';
import 'package:flutter/material.dart';

class GroceryListLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.local_grocery_store,
        size: 30.0,
        color: kAccentColor,
      ),
      radius: 30.0,
    );
  }
}
