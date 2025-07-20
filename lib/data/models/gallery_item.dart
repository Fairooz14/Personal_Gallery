import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryItem {
  final String id;
  final String label;
  final String base64Image;   // <= now stores base64
  final DateTime createdAt;

  GalleryItem({
    required this.id,
    required this.label,
    required this.base64Image,
    required this.createdAt,
  });

  factory GalleryItem.fromFirestore(Map<String, dynamic> data, String id) =>
      GalleryItem(
        id: id,
        label: data['label'],
        base64Image: data['base64Image'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toFirestore() => {
        'label': label,
        'base64Image': base64Image,
        'createdAt': FieldValue.serverTimestamp(),
      };
}