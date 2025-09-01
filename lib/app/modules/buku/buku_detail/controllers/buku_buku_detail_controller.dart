import 'package:get/get.dart';
import 'package:tera_pustaka/app/modules/buku/buku_model.dart';

class BukuBukuDetailController extends GetxController {
  late Buku buku;

  @override
  void onInit() {
    super.onInit();
    buku = Get.arguments as Buku;
  }
}
