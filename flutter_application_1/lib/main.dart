import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MyApp(),
    ),
  );
}
