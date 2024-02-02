import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'navbarwidget.dart'; 


class ParrainagePage extends StatelessWidget {
   ParrainagePage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parrainage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email du membre à parrainer',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String email = _emailController.text;
                if (email.isNotEmpty) {
                  Share.share('Rejoignez notre club et gagnez des récompenses! https://link-to-your-app.com');
                } else {
                  print('Veuillez entrer un email');
                }
              },
              child: Text('Envoyer l\'invitation de parrainage'),
            ),
          ],
        ),
      ),
                 bottomNavigationBar: NavBarWidget(), 

    );
  }
}