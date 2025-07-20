import 'package:flutter/material.dart';
import 'package:gallery/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('Personal Gallery',
              style: TextStyle(fontSize: 32, color: AppColors.brown)),
            const SizedBox(height: 40),
            GlassmorphicContainer(
              width: 220,
              height: 56,
              borderRadius: 28,
              blur: 20,
              alignment: Alignment.center,
              linearGradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
              border: 1,
              borderGradient: const LinearGradient(
              colors: [AppColors.brown, AppColors.brown],
              ),
              child: InkWell(
              onTap: () => Get.toNamed('/gallery'),
              borderRadius: BorderRadius.circular(28),
              child: const Center(
                child: Text(
                'View Gallery',
                style: TextStyle(color: AppColors.brown, fontSize: 16),
                ),
              ),
              ),
            ),
            const SizedBox(height: 20),
            // _glassButton('Add Image', () => Get.toNamed('/add')),
            GlassmorphicContainer(
              width: 220,
              height: 56,
              borderRadius: 28,
              blur: 20,
              alignment: Alignment.center,
              linearGradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
              border: 1,
              borderGradient: const LinearGradient(
              colors: [AppColors.brown, AppColors.brown],
              ),
              child: InkWell(
              onTap: () => Get.toNamed('/add'),
              borderRadius: BorderRadius.circular(28),
              child: const Center(
                child: Text(
                'Add Image',
                style: TextStyle(color: AppColors.brown, fontSize: 16),
                ),
              ),
              ),
            ),
            ],
        ),
      ),
    );
  }

  Widget _glassButton(String text, VoidCallback onTap) => GlassmorphicContainer(
        width: 220,
        height: 56,
        borderRadius: 28,
        blur: 20,
        alignment: Alignment.center,
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
                style: const TextStyle(color: AppColors.brown, fontSize: 16)),
          ),
        ),
      );
}