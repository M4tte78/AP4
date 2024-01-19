import 'package:flutter/material.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class BetPage extends StatelessWidget {
  const BetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes paris', style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => buildMatchListPage(),
              ),
            );
          },
          child: const Text('Voir les matchs'),
        ),
      ),
      bottomNavigationBar: NavBarWidget(),  // Ajoutez votre NavBarWidget ici
    );
  }

  Widget buildMatchListPage() {
    final List<String> matchList = [
      'Match 1',
      'Match 2',
      'Match 3',
      // Ajoutez d'autres matchs selon vos besoins
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des matchs'),
      ),
      body: ListView.builder(
        itemCount: matchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchList[index]),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => buildBetPage(matchName: matchList[index]),
                  ),
                );
              },
              child: const Text('Parier'),
            ),
          );
        },
      ),
      bottomNavigationBar: NavBarWidget(),  // Ajoutez votre NavBarWidget ici
    );
  }

  Widget buildBetPage({required String matchName}) {
    // Ajoutez ici votre logique de pari, par exemple, les champs de texte pour le montant, etc.

    return Scaffold(
      appBar: AppBar(
        title: Text('Parier sur $matchName'),
      ),
      body: Center(
        child: const Text('Contenu de la page de pari'),
      ),
      bottomNavigationBar: NavBarWidget(),  // Ajoutez votre NavBarWidget ici
    );
  }
}