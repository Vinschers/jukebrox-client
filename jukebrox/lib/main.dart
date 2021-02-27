import 'package:flutter/material.dart';
import 'screens/start.dart';

void main() {
  runApp(JukebroxApp());
}

class JukebroxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}
