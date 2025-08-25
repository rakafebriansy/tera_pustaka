import 'package:get/get.dart';

import '../controllers/buku_buku_create_controller.dart';

class BukuBukuCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuCreateController>(
      () => BukuBukuCreateController(),
    );
  }
}
