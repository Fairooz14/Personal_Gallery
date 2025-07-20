import 'package:get/get.dart';
import '../../data/repositories/gallery_repository.dart';
import '../../data/providers/firebase_provider.dart';
import '../../data/models/gallery_item.dart';

class GalleryController extends GetxController {
  final GalleryRepository _repo;
  GalleryController() : _repo = GalleryRepository(FirestoreProvider());
  
  final RxList<GalleryItem> items = <GalleryItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    items.value = await _repo.load();
  }
}