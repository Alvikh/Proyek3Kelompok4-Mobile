// lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoAttend - Login',
      theme: ThemeData(
        primaryColor: Color(0xFF4A90E2),
        fontFamily: 'Arial',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4A90E2),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
