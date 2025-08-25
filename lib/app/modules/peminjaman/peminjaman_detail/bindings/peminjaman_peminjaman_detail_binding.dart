import 'package:get/get.dart';

import '../controllers/peminjaman_peminjaman_detail_controller.dart';

class PeminjamanPeminjamanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanPeminjamanDetailController>(
      () => PeminjamanPeminjamanDetailController(),
    );
  }
}
