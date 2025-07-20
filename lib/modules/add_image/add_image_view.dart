import 'package:flutter/material.dart';
import 'package:gallery/core/theme/app_colors.dart';
import 'package:gallery/modules/add_image/add_image_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glassmorphism/glassmorphism.dart';

class AddImageView extends StatelessWidget {
  AddImageView({super.key});
  final AddImageController c = Get.put(AddImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add Image'),
          backgroundColor: AppColors.beige100,
          foregroundColor: AppColors.brown),
      backgroundColor: AppColors.beige50,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
            children: [
            GestureDetector(
              onTap: c.pickImage,
              child: Obx(() => c.image.value == null
                ? Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 200,
                  decoration: BoxDecoration(
                  color: AppColors.beige200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.brown, // Thin brown border
                    width: 1,
                  ),
                  ),
                  child: const Icon(Icons.add_a_photo, color: AppColors.brown),
                )
                : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                    color: AppColors.brown, // Thin brown border
                    width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.file(
                    c.image.value!,
                    height: 200,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  ),
                )),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: c.labelCtrl,
              decoration: InputDecoration(
              labelText: 'Label',
              filled: true,
              fillColor: AppColors.beige100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                color: AppColors.brown, // Thin brown border
                width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                color: AppColors.brown, // Thin brown border
                width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                color: AppColors.brown, // Thin brown border
                width: 1,
                ),
              ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.brown,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(28),
              ),
              child: _glassButton('Save', c.upload),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glassButton(String text, VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 56,
        child: GlassmorphicContainer(
          width: double.infinity,
          height: 56,
          borderRadius: 28,
          blur: 20,
          linearGradient: LinearGradient(
            colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: 1,
          borderGradient: const LinearGradient(colors: [Colors.white24, Colors.white10]),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(28),
            child: Center(
              child: Text(text,
                  style: const TextStyle(color: AppColors.brown, fontSize: 18)),
            ),
          ),
        ),
      );
}