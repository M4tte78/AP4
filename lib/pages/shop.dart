import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/components/navbarwidget.dart';
import '/models/Product.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late List<Product> products;
  final String baseURL = 'http://localhost:8080';

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseURL/product'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        products = data.map((json) => Product(
          id: json['id_product'],
          title: json['product_title'],
          description: json['product_description'],
          price: json['product_price'],
          image: '$baseURL/uploads/${json['product_img']}',
        )).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> addToCart(int productId) async {
    try {
        final Map<String, dynamic> requestData = {
            'id_product': productId,
            'id_cart': 1,
            'item_quantity': 1
        };

        final response = await http.post(
            Uri.parse('$baseURL/cart/add'),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(requestData),
        );

        if (response.statusCode == 200) {
            print('Produit ajouté au panier avec succès');
        } else {
            print('Échec de l\'ajout au panier');
        }
    } catch (error) {
        print('Erreur lors de l\'ajout au panier: $error');
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutique'),
      ),
      body: products != null
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  leading: Image.network(product.image),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${product.price}\ points'),
                      ElevatedButton(
                        onPressed: () {
                          addToCart(product.id);
                        },
                        child: Text('Ajouter au panier'),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: NavBarWidget(),
    );
  }
}
