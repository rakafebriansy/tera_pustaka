import 'package:get/get.dart';

import '../controllers/peminjaman_peminjaman_create_controller.dart';

class PeminjamanPeminjamanCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanPeminjamanCreateController>(
      () => PeminjamanPeminjamanCreateController(),
    );
  }
}
