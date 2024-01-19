import 'package:firstapp/zombiehome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ZombieHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zombie Social Network'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Zombie Social Network!',
              style: GoogleFonts.creepster(
                fontSize: 25,
                color: Colors.green[700], 
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Image.asset('assets/images/zombie.png'),
              iconSize: 30, // Reduced icon size
              onPressed: () {
                // Navigate to Zombie Profile
              },
            ),
            SizedBox(height: 20), // Add space between icon and button
            ElevatedButton(
              onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ZombieHommePage()),
                        );
                // Navigate to Login Page
              },
              child: Text('Connect'),
              style: ElevatedButton.styleFrom(
                 // Font family
                primary: Colors.green[700], // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}