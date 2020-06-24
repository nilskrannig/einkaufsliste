import 'package:einkaufsliste/models/item_data.dart';
import 'package:einkaufsliste/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceryList extends StatefulWidget {
  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
      builder: (context, itemData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var item = itemData.items[index];

            return ItemTile(
              itemTitle: item.name,
              isChecked: item.isDone,
              checkboxCallback: (checkboxState) {
                itemData.toggleItem(index);
              },
              onLongPress: () {
                itemData.removeItem(index);
              },
            );
          },
          itemCount: itemData.itemCount,
        );
      },
    );
  }
}
