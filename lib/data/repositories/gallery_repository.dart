import 'dart:io';

import 'package:gallery/data/models/gallery_item.dart';
import 'package:gallery/data/providers/firebase_provider.dart';

class GalleryRepository {
  final FirestoreProvider _provider;
  GalleryRepository(this._provider);

  Future<List<GalleryItem>> load() => _provider.fetchGallery();
  Future<void> save(File img, String label) => _provider.addImage(img, label);
}