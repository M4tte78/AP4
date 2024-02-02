import 'package:flutter/material.dart';
import 'package:firstapp/models/Product.dart';
import '/components/add_to_cart.dart';
import '/components/cart_counter.dart';
import '/components/color_and_size.dart';
import '/components/counter_with_fav_btn.dart';
import '/components/description.dart';
import '/components/product_title_with_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components/navbarwidget.dart';


class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Assume you have a list of products for demonstration
  final List<Product> products;

  _ShopPageState() : products = [
    Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Boutique', style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 24,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(), // Add this line to open the drawer
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: products.map((product) => Column(
            children: <Widget>[
              ProductTitleWithImage(product: product),
              ColorAndSize(product: product),
              Description(product: product),
              CounterWithFavBtn(),
              AddToCart(
                product: product,
                onAdd: () => {}, // Empty function for now
                onBuy: openDrawer, key: UniqueKey(),  // Call openDrawer when the user clicks on the buy button
              ),
            ],
          )).toList(),
        ),
      ),
      drawer: Drawer(
        child: CartCounter(),
      ),
      bottomNavigationBar: NavBarWidget(), // Add this line to show the NavBarWidget
    );
  }

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer(); // Use openDrawer instead of openEndDrawer
  }
}