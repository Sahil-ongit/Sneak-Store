import 'package:flutter/material.dart';
import 'package:log/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
   Shoe(
        name: "Air Jordan PSG",
        price: '10,000',
        imagePath: 'lib/images/ajpsg.png', 
        description: 'Nike Air Jordan X Paris Saint Germain'),
    Shoe(
        name: "Air Jordan 1 Zoom",
        price: '7,000',
        imagePath: 'lib/images/ajzoom.png', 
        description: 'Nike Air Jordan 1 Zoom variant'),
    Shoe(
        name: "Air Jordan 1 Mid",
        price: '8,500',
        imagePath: 'lib/images/aj1midW.png', 
        description: 'The Nike Air Jordan 1 mid Womens'),
    Shoe(
        name: "Jumpman MVP",
        price: '9,500',
        imagePath: 'lib/images/jumpman.png', 
        description: 'The Nike Jumpman MVP edition'),
    Shoe(
        name: "Air Jordan 1 ATSV",
        price: '6,000',
        imagePath: 'lib/images/ajspv.png', 
        description: 'Air Jordan 1 Spiderverse'),
    Shoe(
        name: "Air Jordan Legacy",
        price: '12,000',
        imagePath: 'lib/images/ajlegacy.png', 
        description: 'Air Jordan 1 Legacy'),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of items for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List _cartItems = [];

  get cartItems => _cartItems;
  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  //Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i <_cartItems.length;i++){
      totalPrice  +=   double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

