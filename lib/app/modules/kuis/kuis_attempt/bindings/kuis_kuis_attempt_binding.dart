import 'package:get/get.dart';

import '../controllers/kuis_kuis_attempt_controller.dart';

class KuisKuisAttemptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuisKuisAttemptController>(
      () => KuisKuisAttemptController(),
    );
  }
}
