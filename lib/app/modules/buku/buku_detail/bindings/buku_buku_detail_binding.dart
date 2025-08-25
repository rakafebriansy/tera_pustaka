import 'package:get/get.dart';

import '../controllers/buku_buku_detail_controller.dart';

class BukuBukuDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuDetailController>(
      () => BukuBukuDetailController(),
    );
  }
}
