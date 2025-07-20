import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

/// Convert a picked image file → small JPEG → base64
Future<String> imageToBase64(File file) async {
  final bytes = await file.readAsBytes();
  final decoded = img.decodeImage(bytes);
  final resized = img.copyResize(decoded!, width: 800); // shrink
  final jpeg = img.encodeJpg(resized, quality: 75);
  return base64Encode(jpeg);
}

/// base64 → Uint8List for Image.memory(...)
Uint8List base64ToBytes(String b64) => base64Decode(b64);