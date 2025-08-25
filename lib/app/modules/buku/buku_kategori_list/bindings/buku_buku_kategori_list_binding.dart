import 'package:get/get.dart';

import '../controllers/buku_buku_kategori_list_controller.dart';

class BukuBukuKategoriListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuKategoriListController>(
      () => BukuBukuKategoriListController(),
    );
  }
}
