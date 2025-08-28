import 'package:get/get.dart';

class BacaController extends GetxController {
  Rx<String> query = "".obs;
  RxList<String> recommendationBooks = <String>['Satu','Dua','Tiga'].obs;
  RxList<String> popularBooks = <String>['Satu','Dua','Tiga'].obs;
  RxList<String> recommendationJournals = <String>['Satu','Dua','Tiga'].obs;

  void updateQuery(String value) {
    query.value = value;
  }
}
