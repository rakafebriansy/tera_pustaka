class Buku {
  num? id;
  String? judul;
  String? penulis;
  String? penerbit;
  num? tahunTerbit;
  String? isbn;
  String? coverUrl;
  Kategori? kategori;

  Buku({
    this.id,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.isbn,
    this.coverUrl,
    this.kategori,
  });

  Buku.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'] as num?;
    isbn = json['isbn'];
    coverUrl = json['cover_url'];
    kategori =
        json['kategori'] != null ? Kategori?.fromJson(json['kategori']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['penulis'] = penulis;
    data['penerbit'] = penerbit;
    data['tahun_terbit'] = tahunTerbit;
    data['isbn'] = isbn;
    data['cover_url'] = coverUrl;
    if (kategori != null) {
      data['kategori'] = kategori?.toJson();
    }
    return data;
  }
}

class Kategori {
  num? id;
  String? nama;

  Kategori({
    this.id,
    this.nama,
  });

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}
