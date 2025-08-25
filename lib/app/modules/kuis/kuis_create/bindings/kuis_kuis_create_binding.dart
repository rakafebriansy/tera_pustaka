import 'package:get/get.dart';

import '../controllers/kuis_kuis_create_controller.dart';

class KuisKuisCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisKuisCreateController>(
      () => KuisKuisCreateController(),
    );
  }
}
