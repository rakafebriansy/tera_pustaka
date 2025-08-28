import 'package:get/get.dart';

class NulisController extends GetxController {
  Rx<String> query = "".obs;
  RxList<String> myWritings = <String>[
    'Satu',
    'Dua',
    'Tiga',
    'Empat',
    'Lima',
    'Enam',
  ].obs;

  void updateQuery(String value) {
    query.value = value;
  }
}
