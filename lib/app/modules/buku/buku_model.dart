import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';
import 'package:tera_pustaka/app/utilities/kategori_repository.dart';

class Buku {
  final int id;
  final String judul;
  final String penulis;
  final String penerbit;
  final int tahunTerbit;
  final String isbn;
  final String ikhtisar;
  final KategoriBuku kategori;
  final String pdfPath;

  Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.penerbit,
    required this.tahunTerbit,
    required this.isbn,
    required this.kategori,
    required this.ikhtisar,
    required this.pdfPath,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'] as int,
      judul: json['judul'] as String,
      penulis: json['penulis'] as String,
      penerbit: json['penerbit'] as String,
      tahunTerbit: json['tahunTerbit'] is String
          ? int.parse(json['tahunTerbit'])
          : json['tahunTerbit'] as int,
      isbn: json['isbn'] as String,
      ikhtisar: json['ikhtisar'] as String,
      kategori: KategoriBuku.fromJson(json['kategori']),
      pdfPath: json['pdfPath'] as String,
    );
  }

  factory Buku.fromMap(
    Map<String, dynamic> map, {
    required KategoriBuku kategori,
  }) {
    return Buku(
      id: map['id'] as int,
      judul: map['judul'] as String,
      penulis: map['penulis'] as String,
      penerbit: map['penerbit'] as String,
      tahunTerbit: map['tahunTerbit'] is String
          ? int.parse(map['tahunTerbit'])
          : map['tahunTerbit'] as int,
      isbn: map['isbn'] as String,
      pdfPath: map['pdfPath'] as String,
      ikhtisar: map['ikhtisar'] as String,
      kategori: kategori,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'penulis': penulis,
      'penerbit': penerbit,
      'tahunTerbit': tahunTerbit,
      'isbn': isbn,
      'ikhtisar': ikhtisar,
      'kategori': kategori.toJson(),
      'pdfPath': pdfPath,
    };
  }

  Map<String, dynamic> toModelJson() {
    return {
      'id': id,
      'judul': judul,
      'penulis': penulis,
      'penerbit': penerbit,
      'tahunTerbit': tahunTerbit,
      'isbn': isbn,
      'ikhtisar': ikhtisar,
      'kategoriId': kategori.id,
      'pdfPath': pdfPath,
    };
  }

  static Future<Buku> fromModelMap(Map<String, dynamic> map) async {
    final kategori = await KategoriRepository.getKategoriById(
      map['kategoriId'],
    );

    if (kategori == null) {
      throw Exception("Kategori dengan id ${map['kategoriId']} tidak ditemukan");
    }

    return Buku.fromMap(map, kategori: kategori);
  }
}
