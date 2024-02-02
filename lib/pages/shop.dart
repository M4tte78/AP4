import 'package:flutter/material.dart';
import 'package:firstapp/models/Product.dart';
import '/components/add_to_cart.dart';
import '/components/cart_counter.dart';
import '/components/color_and_size.dart';
import '/components/counter_with_fav_btn.dart';
import '/components/description.dart';
import '/components/product_title_with_image.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Assume you have a list of products for demonstration
  final List<Product> products;

  _ShopPageState() : products = [
    Product(
      id: 1,
      image: "assets/images/bag_1.png",
      title: "Example Product",
      description: "This is an example product",
      size: 12,
      price: 29,
      color: Colors.red,
    ),
    Product(
      id: 2,
      image: "assets/images/bag_2.png",
      title: "Example Product 2",
      description: "This is another example product",
      size: 12,
      price: 29,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutique', style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: products.map((product) => Column(
            children: <Widget>[
              ProductTitleWithImage(product: product),
              ColorAndSize(product: product),
              Description(product: product),
              CounterWithFavBtn(),
              AddToCart(product: product),
              CartCounter(),
            ],
          )).toList(),
        ),
      ),
    );
  }
}