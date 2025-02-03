// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/course_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/navigation_drawer.dart';

void main() {
  runApp(SmartEducationApp());
}

class SmartEducationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Education App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/chat': (context) => ChatScreen(),
        '/courses': (context) => CourseScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
