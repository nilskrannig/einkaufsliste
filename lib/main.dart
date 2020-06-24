import 'package:einkaufsliste/models/item_data.dart';
import 'package:einkaufsliste/screens/grocery_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ItemData>(
      create: (context) => ItemData(),
      child: MaterialApp(
        home: GroceryScreen(),
      ),
    );
  }
}
