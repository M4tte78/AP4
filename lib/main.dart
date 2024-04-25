import 'package:firstapp/pages/avantages.dart';
import 'package:firstapp/pages/bet.dart';
import 'package:firstapp/pages/parrainage.dart';
import 'package:firstapp/pages/profil.dart';
import 'package:firstapp/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/pages/register.dart' as registerPage;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RegisterPage(),
      // Routes pour d'autres pages
  routes: {
  '/login': (context) => LoginPage(),
  '/profil': (context) => const ProfilPage(),
  '/avantages': (context) => const AvantagesPage(),
  '/bet': (context) => const BetPage(),
  '/parrainage': (context) => ParrainagePage(),
  '/accueil': (context) => const HomePage(),
},

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OmniBet'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const UserAccountsDrawerHeader(
                    accountName: Text('John Doe'),
                    accountEmail: Text('Johndoe@example.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/astronaut.png'),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 67, 246),
                    ),
                  ),
                  ListTile(
                    title: const Text('Profil'),
                    onTap: () {
                      Navigator.pushNamed(context, '/profil');
                    },
                  ),
                  ListTile(
                    title: const Text('Mes avantages'),
                    onTap: () {
                      Navigator.pushNamed(context, '/avantages');
                    },
                  ),
                  ListTile(
                    title: const Text('Mes paris'),
                    onTap: () {
                      Navigator.pushNamed(context, '/bet');
                    },
                  ),
                  ListTile(
                    title: const Text('Parrainage'),
                    onTap: () {
                      Navigator.pushNamed(context, '/parrainage');
                    },
                  ),
                  ListTile(
                    title: const Text('Se connecter'),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
        
        ],
      ),
    );
  }
}
