import 'package:flutter/material.dart';

import 'catalog.dart';

class CartModel extends ChangeNotifier{
  late CatalogModel _catalogModel;

  CatalogModel get catalog => _catalogModel;

  set catalog(CatalogModel newCatalog) {
    _catalogModel = newCatalog;
    notifyListeners();
  }

  final List<CatalogModel> _catItemsArray = [];

  List<CatalogModel> get catItems => List.unmodifiable(_catItemsArray);

  int get totalPrice {
    return _catItemsArray.fold(0, (total, current) => total + current.catPrice);
  }

  void add(CatalogModel catItem) {
    _catItemsArray.add(catItem);
    notifyListeners();
  }

  void remove(CatalogModel catItem) {
    _catItemsArray.remove(catItem);
    notifyListeners();
  }

  
}