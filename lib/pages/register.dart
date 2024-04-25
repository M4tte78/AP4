import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async'; // Importez le package async pour utiliser Timer

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();

  Future<void> register() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/mobileuser/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
          'user_name': usernameController.text,
          'user_f_name': firstNameController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Si le serveur retourne une réponse OK, parsez le JSON.
        var data = jsonDecode(response.body);
        // Utilisez les données comme vous le souhaitez
        
        // Redirection vers la page de connexion après l'inscription réussie
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Si le serveur ne retourne pas une réponse OK,
        // vous pouvez lancer une exception.
        throw Exception('Failed to register');
      }
    } catch (e) {
      // Si une erreur se produit, affichez un message d'erreur
      print('An error occurred while registering: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S\'inscrire'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Entrez votre adresse e-mail',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre adresse e-mail';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Entrez votre mot de passe',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                return null;
              },
            ),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Entrez votre nom d\'utilisateur',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom d\'utilisateur';
                }
                return null;
              },
            ),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'Entrez votre prénom',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () {
                // Redirection vers la page de connexion
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Vous possédez déjà un compte ? Se connecter'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  register();
                }
              },
              child: const Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';

void login(BuildContext context) async {
  // Vérifiez si les champs sont vides
  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
    setState(() {
      errorMessage = 'Veuillez remplir tous les champs';
    });
    return; // Sortez de la fonction si les champs sont vides
  }

  final response = await http.post(
    Uri.parse('http://localhost:8080/mobileuser/login'), // Remplacez par l'URL de votre API
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': _emailController.text,
      'password': _passwordController.text, // Assurez-vous que votre API attend un mot de passe en clair et non un hash
    }),
  );

  if (response.statusCode == 200) {
    // Si le serveur retourne une réponse OK, parsez le JSON.
    var data = jsonDecode(response.body);
    // Utilisez les données comme vous le souhaitez

    // Redirection vers la page d'accueil après une connexion réussie
    Navigator.pushReplacementNamed(context, '/accueil');
  } else {
    // Si le serveur ne retourne pas une réponse OK,
    // vous pouvez lancer une exception.
    setState(() {
      errorMessage = 'Échec de la connexion';
    });

    // Effacer le message d'erreur après 5 secondes
    Timer(Duration(seconds: 5), () {
      setState(() {
        errorMessage = '';
      });
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Se connecter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
              ),
              obscureText: true,
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                login(context); // Passer le context en paramètre
              },
              child: const Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}

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
    );
  }
}
