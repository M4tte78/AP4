import 'package:firstapp/bet.dart';
import 'package:firstapp/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          title: const Text('OmniChat'),
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
                    ),
                    ListTile(
                      title: const Text('Profile'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Mes informations'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.account_circle), Pour ajouter une icone si besoins 
                      title: const Text('Mes paris'),
                      onTap: () {
                        // Action à exécuter lors du clic sur le bouton flottant
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BetPage()));
                      },
                    ),
                    ListTile(
                      title: const Text('Parrainage'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Se connecter'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                    ),
                    // Add more list items here if you want...
                  ],
                ),
              ),
          
              // Align the logout and theme buttons to the bottom and left and right side of the drawer
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
        body: CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: ['assets/images/basket.jpg', 'assets/images/foot.jpg', 'assets/images/volley.jpg'].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.asset(i, fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}