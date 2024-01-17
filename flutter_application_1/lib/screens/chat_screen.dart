import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String username;

  ChatScreen({required this.username});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.username}'),
      ),
      body: Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}
