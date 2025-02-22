import 'package:flutter/material.dart';
import 'package:text_recognition/services/text_recognition_service.dart';
import 'dart:io';

class ResultScreen extends StatefulWidget {
  final File image;

  ResultScreen({required this.image});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String _recognizedText = '';

  @override
  void initState() {
    super.initState();
    _recognizeText();
  }

  Future<void> _recognizeText() async {
    final text = await TextRecognitionService.recognizeText(widget.image);
    setState(() {
      _recognizedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recognized Text')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(_recognizedText, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
