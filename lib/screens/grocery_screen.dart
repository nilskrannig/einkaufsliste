import 'package:einkaufsliste/components/delete_alert.dart';
import 'package:einkaufsliste/components/grocery_list_add_item_button.dart';
import 'package:einkaufsliste/components/grocery_list_logo.dart';
import 'package:einkaufsliste/components/grocery_list_subtitle.dart';
import 'package:einkaufsliste/components/grocery_list_title.dart';
import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/widgets/grocery_list.dart';
import 'package:flutter/material.dart';

class GroceryScreen extends StatefulWidget {
  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  Widget buildBottomSheet(BuildContext context) => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GroceryListAddItemButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GroceryListHeader(),
          GroceryListBody(),
        ],
      ),
    );
  }
}

class GroceryListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: GroceryList(),
        decoration: kGroceryListDecoration,
      ),
    );
  }
}

class GroceryListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GroceryListLogo(),
              SizedBox(
                height: 10.0,
              ),
              GroceryListTitle(),
              GroceryListSubtitle(),
            ],
          ),
        ),
        Positioned(
          width: 60,
          right: 2,
          bottom: 2,
          child: FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteAlert();
                  });
            },
            child: Icon(
              Icons.delete,
              size: 26.0,
              color: kAccentColor,
            ),
          ),
        ),
      ],
    );
  }
}
