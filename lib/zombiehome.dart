import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstapp/zombiehome.dart';

class ZombieHommePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zombie Social Network',
          style: GoogleFonts.creepster(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: GoogleFonts.creepster(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
            ),
            ListTile(
              title: Text(
                'Add Friends',
                style: GoogleFonts.creepster(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              
              onTap: () {
                // Navigate to Add Friends Page
              },
            ),
            ListTile(
              title: Text(
                'Retour',
                style: GoogleFonts.creepster(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                // Navigate to Add Friends Page
              },
            
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the number of posts
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                'Post $index',
                style: GoogleFonts.creepster(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'This is the content of post $index.',
                style: GoogleFonts.creepster(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}