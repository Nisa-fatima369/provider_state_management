
import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier{
  final List<int> _selectedItem = [];
  List<String> _itemNames = [];

  List<int> get selectedItem => _selectedItem;
  List<String> get itemNames => _itemNames;

  Future<void> fetchItemNames () async {
    await Future.delayed(const Duration(seconds: 1));
    _itemNames = List.generate(10000000, (index) => "Item $index");
    notifyListeners();
  }

  void addItem(int value){
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }
}