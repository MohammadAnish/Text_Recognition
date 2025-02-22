import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

class TextRecognitionService {
  static Future<String> recognizeText(File image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.devanagiri);
    final inputImage = InputImage.fromFile(image);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    await textRecognizer.close();
    return cleanHindiText(recognizedText.text);
  }

  static String cleanHindiText(String text) {
    return text.replaceAll("\n", " ").replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
