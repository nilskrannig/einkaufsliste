import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:einkaufsliste/models/item.dart';

class ItemData extends ChangeNotifier {
  List<Item> _items = [];

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void toggleItem(int index) {
    _items[index].toggleDone();
    notifyListeners();
  }

  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void removeAllItems() {
    _items = [];
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }
}
