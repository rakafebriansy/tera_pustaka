import 'package:get/get.dart';

import '../controllers/buku_buku_kategori_edit_controller.dart';

class BukuBukuKategoriEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuKategoriEditController>(
      () => BukuBukuKategoriEditController(),
    );
  }
}
