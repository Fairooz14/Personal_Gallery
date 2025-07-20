import 'package:get/get.dart';
// import '../../data/providers/firestore_provider.dart';
// TODO: Update the import path below if the file exists elsewhere, or remove if not needed.
import '../../data/repositories/gallery_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => FirestoreProvider());
    Get.lazyPut(() => GalleryRepository(Get.find()));
    // Remove duplicate registration if not needed
    // Get.lazyPut(() => GalleryRepository(Get.find()));
  }
}