import 'package:get/get.dart';
import '../bindings/app_binding.dart';
import '../../modules/home/home_view.dart';
import '../../modules/gallery/gallery_view.dart';
import '../../modules/add_image/add_image_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/',       page: () =>  const HomeView(), binding: AppBinding()),
    GetPage(name: '/gallery',page: () =>  GalleryView()),
    GetPage(name: '/add',    page: () =>  AddImageView()),
  ];
}