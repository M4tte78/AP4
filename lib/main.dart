import 'package:firstapp/bet.dart';
import 'package:firstapp/login.dart';
import 'package:flutter/material.dart';
import 'navbarwidget.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
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
                        backgroundImage: AssetImage('assets/images/astronaut.png'), // image avatar
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 67, 246),
                      )
                    ),
                    ListTile(
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Mes informations'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Mes paris'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BetPage()));
                      },
                    ),
                    ListTile(
                      title: const Text('Parrainage'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Se connecter'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()));
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
                      // Add your logout logic here
                    },
                    child: const Icon(Icons.logout),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_themeMode == ThemeMode.light) {
                          _themeMode = ThemeMode.dark;
                        } else {
                          _themeMode = ThemeMode.light;
                        }
                      });
                    },
                    child: const Icon(Icons.brightness_6),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
  children: [
    GestureDetector(
      onTap: () {
        print('Image basket.jpg tapped!');
        // Ajoutez votre logique de clic ici
      },
      child: Container(
        height: 100, // Définissez la hauteur de l'image
        width: 100, // Définissez la largeur de l'image
        
        margin: EdgeInsets.all(10.0),
        child: Image.asset('assets/images/basket.jpg', fit: BoxFit.cover),
      ),
    ),
    GestureDetector(
      onTap: () {
        print('Image foot.jpg tapped!');
        // Ajoutez votre logique de clic ici
      },
      child: Container(
        height: 100, // Définissez la hauteur de l'image
        width: 100, // Définissez la largeur de l'image
        margin: EdgeInsets.all(10.0),
        child: Image.asset('assets/images/foot.jpg', fit: BoxFit.cover),
      ),
    ),
    GestureDetector(
      onTap: () {
        print('Image volley.jpg tapped!');
        // Ajoutez votre logique de clic ici
      },
      child: Container(
        height: 100, // Définissez la hauteur de l'image
        width: 100, // Définissez la largeur de l'image
        margin: EdgeInsets.all(10.0),
        child: Image.asset('assets/images/volley.jpg', fit: BoxFit.cover),
      ),
    ),
    // Ajoutez plus de conteneurs pour plus d'images
  ],
),
        bottomNavigationBar: NavBarWidget(), // Utilisez NavBarWidget comme barre de navigation inférieure
      ),
    );
  }
}