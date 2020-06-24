import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/screens/add_item_screen.dart';
import 'package:flutter/material.dart';

class GroceryListAddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kAccentColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddItemScreen(),
          ),
          isScrollControlled: true,
        );
      },
      child: Icon(Icons.add),
    );
  }
}
