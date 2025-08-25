import 'package:get/get.dart';

import '../controllers/buku_buku_kategori_create_controller.dart';

class BukuBukuKategoriCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuKategoriCreateController>(
      () => BukuBukuKategoriCreateController(),
    );
  }
}
