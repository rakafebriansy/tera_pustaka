import 'package:get/get.dart';

class MisiController extends GetxController {
  Rx<String> query = "".obs;
  RxList<String> myOngoingMissions = <String>[
    'Satu',
    'Dua',
    'Tiga',
    'Empat',
    'Lima',
    'Enam',
  ].obs;
  RxList<String> myCompletedMissions = <String>[
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
