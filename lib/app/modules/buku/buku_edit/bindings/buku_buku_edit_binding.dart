import 'package:get/get.dart';

import '../controllers/buku_buku_edit_controller.dart';

class BukuBukuEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuEditController>(
      () => BukuBukuEditController(),
    );
  }
}
