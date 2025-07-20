import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/gallery_item.dart';
import 'gallery_controller.dart';

class GalleryView extends StatelessWidget {
  GalleryView({super.key});
  final GalleryController c = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: AppColors.beige100,
        foregroundColor: AppColors.brown,
      ),
      backgroundColor: AppColors.beige50,
      body: Obx(() {
        if (c.items.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.brown),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: c.items.length,
          itemBuilder: (_, i) {
            final item = c.items[i];
            return GestureDetector(
              onTap: () => Get.to(() => FullscreenImage(item)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(
                  base64Decode(item.base64Image),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

/* ---------- Full-screen viewer ---------- */
class FullscreenImage extends StatelessWidget {
  final GalleryItem item;
  const FullscreenImage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 3,
            child: Center(
              child: Image.memory(
                base64Decode(item.base64Image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: Get.back,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                item.label,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}