import 'package:flutter/material.dart';

class Category extends ChangeNotifier {
  //list of company brands
  final List _categorybrand = [
    ['Nike', 'lib/images/Nike-Logo-now.png', Colors.white,],
    ['Puma', 'lib/images/PUMA-Logo1.png', Colors.white],
    ['Adidas', 'lib/images/Adidas-Logo-now.jpg', Colors.white],
  ];
 
 // list of brands
  List _brandlist = [];

  get categorybrand => _categorybrand;

  //routing to another page
  
}
