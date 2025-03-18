// ARQUIVO: widgets/cart_manager.dart
import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String imagePath;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imagePath,
  });
}

class CartManager {
  // Singleton pattern
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  static CartManager get instance => _instance;

  // State
  final List<CartItem> _items = [];

  // Getters
  List<CartItem> get items => _items;
  int get itemCount => _items.length;
  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // Methods
  void addItem(String name, double price, int quantity, String imagePath) {
    // Check if item already exists
    bool found = false;
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].name == name) {
        // Replace with updated quantity
        _items[i] = CartItem(
          name: name,
          price: price,
          quantity: _items[i].quantity + quantity,
          imagePath: imagePath,
        );
        found = true;
        break;
      }
    }

    // If item doesn't exist, add it
    if (!found) {
      _items.add(CartItem(
        name: name,
        price: price,
        quantity: quantity,
        imagePath: imagePath,
      ));
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }

  void clearCart() {
    _items.clear();
  }
}