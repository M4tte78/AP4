import 'package:flutter/material.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:firstapp/components/appbar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
    title: 'Boutique',
    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
  ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('Changer la photo de profil');
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/astronaut.png'),
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Nom d\'utilisateur'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Email'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Mot de passe'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Préférences'),
              trailing: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarWidget(),  // Placez le NavBarWidget ici
    );
  }
}