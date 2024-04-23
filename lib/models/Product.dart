import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.id});
}