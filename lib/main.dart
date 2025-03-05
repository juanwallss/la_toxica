import 'package:flutter/material.dart';
import 'package:la_toxica/config/theme/app_theme.dart';
import 'package:la_toxica/presentation/screen/chat/chat_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(0).getTheme(),
      home: const ChatScreen()
    );
  }
}
