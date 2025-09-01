import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';

class KategoriRepository {
  static Future<List<KategoriBuku>> allKategoris() async {
    final String jsonString = await rootBundle.loadString(
      'assets/startup_data/kategori_buku.json',
    );
    final List<dynamic> data = jsonDecode(jsonString);

    return data.map((e) => KategoriBuku.fromJson(e)).toList();
  }

  static Future<KategoriBuku?> getKategoriById(int id) async {
    final kategoris = await allKategoris();
    try {
      return kategoris.firstWhere((kategori) => kategori.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<KategoriBuku?> getKategoriByNama(String nama) async {
    final kategoris = await allKategoris();
    try {
      return kategoris.firstWhere(
        (kategori) => kategori.nama.toLowerCase() == nama.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
