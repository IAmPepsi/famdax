// lib/providers/chat_provider.dart
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<String> messages = [];

  void addMessage(String message) {
    messages.add(message);
    notifyListeners();
  }

  void removeOldestMessage() {
    if (messages.isNotEmpty) {
      messages.removeAt(0);
      notifyListeners();
    }
  }
}
