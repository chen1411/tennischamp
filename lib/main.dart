import 'package:flutter/material.dart';
import 'package:tennischamp/screens/home_screen.dart';

import 'screens/tutorial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duolingo',
      routes: {
        '/': (context) => HomeScreen(),
        '/tutorial': (context) => TutorialScreen(),
      }
    );
  }
}