import 'package:flutter/material.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopItem {
  final String name;
  final String description;
  final String image;
  final int price;

  ShopItem({required this.name, required this.description, required this.image, required this.price});
}

class ShopPage extends StatelessWidget {
  final List<ShopItem> items = [
    ShopItem(name: 'Football Jersey', description: 'High quality football jersey', image: 'assets/images/MaillotFFF.jpg', price: 100),
    ShopItem(name: 'Sweater', description: 'Warm and cozy sweater', image: 'assets/images/pull.jpg', price: 80),
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OmniShop', style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      ),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.asset(items[index].image), // Replace with your images
                ListTile(
                  title: Text(items[index].name),
                  subtitle: Text(items[index].description),
                ),
                Text('Price: ${items[index].price} points'),
                TextButton(
                  child: const Text('BUY'),
                  onPressed: () { /* Place your order logic here */ },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}