import 'package:flutter/material.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:firstapp/pages/avantages.dart';
import 'package:firstapp/pages/bet.dart';
import 'package:firstapp/pages/login.dart';
import 'package:firstapp/pages/parrainage.dart';
import 'package:firstapp/pages/profil.dart';
import 'package:google_fonts/google_fonts.dart';

class Comment {
  final String userName;
  final String commentText;

  Comment({required this.userName, required this.commentText});
}

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
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Comment> comments = [
    Comment(userName: 'User1', commentText: 'Comment 1'),
    Comment(userName: 'User2', commentText: 'Comment 2'),
    // Ajoutez d'autres commentaires selon vos besoins
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      _pageController.animateToPage(
        (_currentPage + 1) % 3,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OmniBet',
                style: GoogleFonts.lemon(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.sports_basketball),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 13, 67, 246),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
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
                        leading: Icon(Icons.account_circle),
                        title: const Text('Profil'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.star),
                        title: const Text('Mes avantages'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AvantagesPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.sports_soccer),
                        title: const Text('Mes paris'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BetPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.group),
                        title: const Text('Parrainage'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ParrainagePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.login),
                        title: const Text('Se connecter'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Ajoutez votre logique de déconnexion ici
                    },
                    child: const Text('Se déconnecter'),
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
                    child: const Text('Changer de thème'),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return buildImageCard(index);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return buildCommentCard(comments[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavBarWidget(),
      ),
    );
  }

  Widget buildCommentCard(Comment comment) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              comment.commentText,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(int index) {
    String imagePath;
    String sportName;

    switch (index) {
      case 0:
        imagePath = 'assets/images/basket.jpg';
        sportName = 'Basket';
        break;
      case 1:
        imagePath = 'assets/images/foot.jpg';
        sportName = 'Foot';
        break;
      case 2:
        imagePath = 'assets/images/volley.jpg';
        sportName = 'Volley';
        break;
      default:
        imagePath = 'assets/images/default.jpg';
        sportName = 'Default';
    }

    return GestureDetector(
      onTap: () {
        print('Image $imagePath tapped!');
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
