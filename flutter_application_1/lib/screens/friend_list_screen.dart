// lib/screens/friend_list_screen.dart
import 'package:flutter/material.dart';

class FriendListScreen extends StatefulWidget {
  final List<String> friends;

  FriendListScreen({required this.friends});

  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend List'),
      ),
      body: ListView.builder(
        itemCount: widget.friends.length,
        itemBuilder: (context, index) {
          String friendUsername = widget.friends[index];
          return ListTile(
            title: Text(friendUsername),
          );
        },
      ),
    );
  }
}
