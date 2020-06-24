import 'package:einkaufsliste/models/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
