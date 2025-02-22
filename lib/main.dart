import 'package:flutter/material.dart';
import 'package:text_recognition/screens/home_screen.dart';

void main() {
  runApp(TextRecognitionApp());
}

class TextRecognitionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}