// lib/screens/chat_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/chat_provider.dart';
import 'user_list_screen.dart';
import 'friend_list_screen.dart';

class ChatScreen extends StatefulWidget {
  final String username;

  ChatScreen({required this.username});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.username}'),
        actions: [
          IconButton(
            icon: Icon(Icons.group),
            onPressed: () {
              _navigateToUserList();
            },
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              _navigateToFriendList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatProvider.messages[index]),
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage(context);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    var chatProvider = Provider.of<ChatProvider>(context, listen: false);

    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      chatProvider.addMessage('${widget.username}: $message');
      _messageController.clear();
      _scheduleMessageRemoval(context);
    }
  }

  void _scheduleMessageRemoval(BuildContext context) {
    var chatProvider = Provider.of<ChatProvider>(context, listen: false);

    // Schedule the removal of the last message after 60 seconds
    Future.delayed(Duration(seconds: 60), () {
      chatProvider.removeOldestMessage();
    });
  }

  void _navigateToUserList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserListScreen(currentUsername: widget.username),
      ),
    );
  }

  void _navigateToFriendList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FriendListScreen(friends: []),
      ),
    );
  }
}
