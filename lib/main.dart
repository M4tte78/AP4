import 'package:firstapp/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
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
                      accountName: Text('User Name'),
                      accountEmail: Text('user@example.com'),
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
                    // Add more list items here if you want...
                  ],
                ),
              ),
              // Align the logout and theme buttons to the bottom and left and right side of the drawer
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add your logout logic here
                      },
                      child: Icon(Icons.logout),
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
                      child: Icon(Icons.brightness_6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action à exécuter lors du clic sur le bouton flottant
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Icon(Icons.account_circle), // Icône de compte
        ),
      ),
    );
  }
}