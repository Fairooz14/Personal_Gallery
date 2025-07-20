// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import '../../data/models/image_model.dart';

// class FullscreenImageScreen extends StatelessWidget {
//   final ImageModel img;
//   const FullscreenImageScreen({super.key, required this.img});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF667eea), Color(0xFF764ba2)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: Hero(
//             tag: img.id,
//             child: InteractiveViewer(
//               child: CachedNetworkImage(
//                 imageUrl: img.url,
//                 placeholder: (_, __) =>
//                     const CircularProgressIndicator(color: Colors.white),
//                 errorWidget: (_, __, ___) => const Icon(Icons.broken_image,
//                     size: 120, color: Colors.white),
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }