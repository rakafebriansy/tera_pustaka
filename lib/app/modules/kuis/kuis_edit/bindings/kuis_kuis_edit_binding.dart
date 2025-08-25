import 'package:get/get.dart';

import '../controllers/kuis_kuis_edit_controller.dart';

class KuisKuisEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisKuisEditController>(
      () => KuisKuisEditController(),
    );
  }
}
