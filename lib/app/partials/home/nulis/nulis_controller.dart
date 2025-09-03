import 'package:get/get.dart';
import 'package:tera_pustaka/app/modules/buku/buku_model.dart';
import 'package:tera_pustaka/app/utilities/database_helper.dart';

class NulisController extends GetxController {
  Rx<String> query = "".obs;
  RxList<Buku> myWritingBooks = <Buku>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyWritingsBooks();
  }

  Future<void> fetchMyWritingsBooks() async {
    final db = await DatabaseHelper.database;
    final result = await db.query("buku");

    List<Buku> books = [];
    for (final row in result) {
      final buku = await Buku.fromModelMap(row);
      books.add(buku);
    }

    this.myWritingBooks.value = books;
  }

  void updateQuery(String value) {
    query.value = value;
  }
}
