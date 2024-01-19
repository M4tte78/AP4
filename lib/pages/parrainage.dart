import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:google_fonts/google_fonts.dart';


class ParrainagePage extends StatelessWidget {
   ParrainagePage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parrainage', style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
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