import 'package:get/get.dart';

import '../controllers/peminjaman_peminjaman_list_controller.dart';

class PeminjamanPeminjamanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanPeminjamanListController>(
      () => PeminjamanPeminjamanListController(),
    );
  }
}
