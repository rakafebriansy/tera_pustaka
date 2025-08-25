import 'package:get/get.dart';

import '../controllers/kuis_kuis_list_controller.dart';

class KuisKuisListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisKuisListController>(
      () => KuisKuisListController(),
    );
  }
}
