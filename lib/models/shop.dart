import 'package:add_to_cart/models/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  // food Menu
  final List<Food> _foodMenu = [
    // pavbhaji
    Food(
        name: "Pav Bhaji",
        price: "220.00",
        imagePath: "lib/images/pavbhaji.png",
        rating: "4.5"),

    // samosa
    Food(
        name: "Samosa",
        price: "40.00",
        imagePath: "lib/images/samosa.png",
        rating: "4.3"),
  ];

  // Customer Cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from  cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
  


}
