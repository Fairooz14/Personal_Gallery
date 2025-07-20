import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/gallery_item.dart';
import '../../core/utils/image_utils.dart';

class FirestoreProvider {
  final _fire = FirebaseFirestore.instance;

  Future<List<GalleryItem>> fetchGallery() async {
    final snap = await _fire
        .collection('gallery')
        .orderBy('createdAt', descending: true)
        .get();
    return snap.docs
        .map((d) => GalleryItem.fromFirestore(d.data(), d.id))
        .toList();
  }

  Future<void> addImage(File file, String label) async {
    final base64 = await imageToBase64(file);
    await _fire.collection('gallery').add(
          GalleryItem(
            id: '',
            label: label,
            base64Image: base64,
            createdAt: DateTime.now(),
          ).toFirestore(),
        );
  }
}