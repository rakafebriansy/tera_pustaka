import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';

class Buku {
  num? id;
  String? judul;
  String? penulis;
  String? penerbit;
  num? tahunTerbit;
  String? isbn;
  String? coverUrl;
  String? ikhtisar;
  KategoriBuku? kategori;

  Buku({
    this.id,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.isbn,
    this.coverUrl,
    this.kategori,
    this.ikhtisar,
  });

  Buku.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'] as num?;
    isbn = json['isbn'];
    ikhtisar = json['ikhtisar'];
    coverUrl = json['cover_url'];
    kategori = json['kategori'] != null
        ? KategoriBuku?.fromJson(json['kategori'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['penulis'] = penulis;
    data['penerbit'] = penerbit;
    data['tahun_terbit'] = tahunTerbit;
    data['isbn'] = isbn;
    data['ikhtisar'] = ikhtisar;
    data['cover_url'] = coverUrl;
    if (kategori != null) {
      data['kategori'] = kategori?.toJson();
    }
    return data;
  }
}
