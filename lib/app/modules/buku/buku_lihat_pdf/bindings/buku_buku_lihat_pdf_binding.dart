import 'package:get/get.dart';

import '../controllers/buku_buku_lihat_pdf_controller.dart';

class BukuBukuLihatPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuBukuLihatPdfController>(
      () => BukuBukuLihatPdfController(),
    );
  }
}
