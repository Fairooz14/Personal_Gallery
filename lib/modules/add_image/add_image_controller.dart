import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/repositories/gallery_repository.dart';
import '../../data/providers/firebase_provider.dart';

class AddImageController extends GetxController {
  final GalleryRepository _repo = GalleryRepository(FirestoreProvider());

  final Rx<File?> image = Rx<File?>(null);
  final TextEditingController labelCtrl = TextEditingController();

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) image.value = File(picked.path);
  }

  Future<void> upload() async {
    if (image.value == null || labelCtrl.text.isEmpty) {
      Get.snackbar('Oops', 'Please pick an image and add a label');
      return;
    }
    await _repo.save(image.value!, labelCtrl.text);
    Get.back();
    Get.snackbar('Success', 'Image saved!');
  }

  @override
  void onClose() {
    labelCtrl.dispose();
    super.onClose();
  }
}