import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/models/item_data.dart';
import 'package:einkaufsliste/screens/add_item_screen.dart';
import 'package:einkaufsliste/widgets/grocery_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 10.0),
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
                          return AlertDialog(
                            title: Text('Alle Einträge löschen?'),
                            actions: [
                              FlatButton(
                                color: kPrimaryColorDark,
                                textColor: Colors.white,
                                child: Text('löschen'),
                                onPressed: () {
                                  Provider.of<ItemData>(context, listen: false)
                                      .removeAllItems();
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
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GroceryList(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class GroceryListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Einkauf',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 50.0,
      ),
    );
  }
}

class GroceryListSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<ItemData>(context).itemCount;
    String subtitleText;
    itemCount == 1
        ? subtitleText = 'Besorge dieses Ding'
        : subtitleText = 'Besorge diese ${itemCount} Dinge';

    return Text(
      subtitleText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
