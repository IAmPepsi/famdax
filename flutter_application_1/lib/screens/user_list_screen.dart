// lib/screens/user_list_screen.dart
import 'package:flutter/material.dart';
import 'friend_list_screen.dart';

class UserListScreen extends StatefulWidget {
  final String currentUsername;

  UserListScreen({required this.currentUsername});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<String> users = ['exampleUser1', 'exampleUser2', 'exampleUser3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          String username = users[index];
          if (username != widget.currentUsername) {
            return ListTile(
              title: Text(username),
              onTap: () {
                _addFriend(username);
              },
            );
          } else {
            return SizedBox.shrink(); // Hide current user in the list
          }
        },
      ),
    );
  }

  void _addFriend(String friendUsername) {
    print('Added $friendUsername as a friend!');
    Navigator.pop(context); // Go back to the chat screen
    _navigateToFriendList();
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
