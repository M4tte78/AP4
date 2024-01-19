import 'package:flutter/material.dart';
import 'navbarwidget.dart'; 


class AvantagesPage extends StatelessWidget {
  const AvantagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avantages'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.local_offer, color: Colors.blue),
                      title: Text('Promo sur les paris'),
                      subtitle: Text('Acumulez 10 paris pour avoir un pari gratuit'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.star, color: Colors.yellow),
                      title: Text('Nombre de points'),
                      subtitle: Text('Vous avez accumulé 500 points.'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.card_giftcard, color: Colors.red),
                      title: Text('Cadeaux'),
                      subtitle: Text('Vous avez un cadeau à réclamer.'),
                    ),
                  ),
                  // Ajoutez plus de cartes pour plus d'avantages...
                ],
              ),
            ),
          ),
          Container(
  color: Colors.blue,
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      Text(
        'Rentrez le code créateur "Omnibet10" pour nous soutenir et avoir -10% sur vos 5 prochains paris',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Entrez le code créateur ici',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ],
  ),
),
        ],
      ),
     bottomNavigationBar: NavBarWidget(), 
    );
  }
}