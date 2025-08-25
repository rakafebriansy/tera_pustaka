import 'package:get/get.dart';

import '../controllers/buku_buku_list_controller.dart';

class BukuBukuListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuListController>(
      () => BukuBukuListController(),
    );
  }
}
