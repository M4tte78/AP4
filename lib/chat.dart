import 'package:flutter/material.dart';
import 'navbarwidget.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
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