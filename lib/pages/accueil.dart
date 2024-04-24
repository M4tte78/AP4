import 'package:firstapp/components/navbarwidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Bienvenue sur la page d\'accueil !',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              // Redirection vers la page de profil
              Navigator.pushNamed(context, '/profil');
            },
            child: const Text('Aller vers une autre page'),
          ),
        ],
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
                    accountEmail: Text('johndoe@example.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/astronaut.png'),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 67, 246),
                    ),
                  ),
                  ListTile(
                    title: const Text('Accueil'),
                    onTap: () {
                      Navigator.pop(context); // Fermer le drawer
                    },
                  ),
                  ListTile(
                    title: const Text('Profil'),
                    onTap: () {
                      Navigator.pop(context); // Fermer le drawer
                      Navigator.pushNamed(context, '/profil');
                    },
                  ),
                  ListTile(
                    title: const Text('Mes avantages'),
                    onTap: () {
                      Navigator.pop(context); // Fermer le drawer
                      Navigator.pushNamed(context, '/avantages');
                    },
                  ),
                  ListTile(
                    title: const Text('Mes paris'),
                    onTap: () {
                      Navigator.pop(context); // Fermer le drawer
                      Navigator.pushNamed(context, '/bet');
                    },
                  ),
                  ListTile(
                    title: const Text('Parrainage'),
                    onTap: () {
                      Navigator.pop(context); // Fermer le drawer
                      Navigator.pushNamed(context, '/parrainage');
                    },
                  ),
                  ListTile(
                    title: const Text('Se connecter'),
                    onTap: () {
                      Navigator.pop(context); // Fermer le drawer
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Gérer la déconnexion ici
                  },
                  child: const Icon(Icons.logout),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Mettez ici la logique pour changer le thème si nécessaire
                  },
                  child: const Icon(Icons.brightness_6),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}