import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DebugHelper {
  static Future<void> debugPrintBuku() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'buku.db');
    final db = await openDatabase(path);

    final List<Map<String, dynamic>> result = await db.query('buku');
    for (var row in result) {
      print("📖 ${row.toString()}");
    }
  }
}
