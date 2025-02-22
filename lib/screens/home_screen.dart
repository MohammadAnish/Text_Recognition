import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/services/image_picker_service.dart';
import 'package:text_recognition/screens/result_screen.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePickerService.pickImage(source);
    if (image != null) {
      setState(() {
        _image = image;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(image: _image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Recognition')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null ? Image.file(_image!, height: 200) : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Capture Image'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Pick from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
