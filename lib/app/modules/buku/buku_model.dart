import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';

class Buku {
  num? id;
  String? judul;
  String? penulis;
  String? penerbit;
  num? tahunTerbit;
  String? isbn;
  String? ikhtisar;
  KategoriBuku? kategori;
  String? pdfPath;

  Buku({
    this.id,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.isbn,
    this.kategori,
    this.ikhtisar,
    this.pdfPath,
  });

  Buku.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahunTerbit'] as num?;
    isbn = json['isbn'];
    ikhtisar = json['ikhtisar'];
    kategori = json['kategori'] != null
        ? KategoriBuku?.fromJson(json['kategori'])
        : null;
    pdfPath = json['pdfPath'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['penulis'] = penulis;
    data['penerbit'] = penerbit;
    data['tahunTerbit'] = tahunTerbit;
    data['isbn'] = isbn;
    data['ikhtisar'] = ikhtisar;
    if (kategori != null) {
      data['kategori'] = kategori?.toJson();
    }
    data['pdfPath'] = pdfPath;
    return data;
  }

  Map<String, dynamic> toModelJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['penulis'] = penulis;
    data['penerbit'] = penerbit;
    data['tahunTerbit'] = tahunTerbit;
    data['isbn'] = isbn;
    data['ikhtisar'] = ikhtisar;
    data['kategoriId'] = kategori?.id;
    data['pdfPath'] = pdfPath;
    return data;
  }
}
