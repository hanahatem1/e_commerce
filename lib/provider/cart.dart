import 'package:e_commerce/items/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
 List selectedItems = [];
 int price = 0;

 add(item product){
  price +=product.price.round();
  selectedItems.add(product);
  notifyListeners();
 }

 remove(item product){
  price -= product.price.round();
  selectedItems.remove(product);
  notifyListeners();
 }
}