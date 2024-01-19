import 'package:flutter/material.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OmniChat', style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Start new conversation',
            onPressed: () {
              // Navigate to the conversation creation screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20, // Replace with your list of conversations
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Conversation $index'),
            subtitle: Text('Last message in conversation $index'),
            onTap: () {
              // Navigate to the conversation screen
            },
          );
        },
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}