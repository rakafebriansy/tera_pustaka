import 'package:get/get.dart';
import 'package:tera_pustaka/app/modules/buku/buku_model.dart';
import 'package:tera_pustaka/app/utilities/database_helper.dart';

class BacaController extends GetxController {
  Rx<String> query = "".obs;
  RxList<Buku> recommendationBooks = <Buku>[].obs;
  RxList<Buku> popularBooks = <Buku>[].obs;
  RxList<Buku> recommendationJournals = <Buku>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecommendationBooks();
  }

  Future<void> fetchRecommendationBooks() async {
    final db = await DatabaseHelper.database;
    final result = await db.query("buku", limit: 10);

    List<Buku> books = [];
    for (final row in result) {
      final buku = await Buku.fromModelMap(row);
      books.add(buku);
    }

    this.recommendationBooks.value = books;
  }

  void updateQuery(String value) {
    query.value = value;
  }
}
