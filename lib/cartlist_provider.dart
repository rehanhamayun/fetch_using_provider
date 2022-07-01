import 'package:flutter/material.dart';

class CartList with ChangeNotifier {
  List<String> _selectedProduct = [];

  List<String> get selectedProduct => _selectedProduct;

  void addProduct(String productName) {
    _selectedProduct.add(productName);
    notifyListeners();
  }
}
