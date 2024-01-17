import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/chat_provider.dart';
import '/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('User Registration'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _registerUser(context, chatProvider);
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _registerUser(BuildContext context, ChatProvider chatProvider) {
    String username = _usernameController.text.trim();
    List<String> passwordWords = _generateRandomWords();
    chatProvider.addMessage('Added $username as a friend!');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(username: username),
      ),
    );
  }

  List<String> _generateRandomWords() {
    return ['apple', 'banana', 'cherry', 'dog', 'elephant', 'forest', 'grape', 'house', 'ice cream', 'jazz'];
  }
}
