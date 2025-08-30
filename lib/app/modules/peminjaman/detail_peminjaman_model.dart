import 'package:tera_pustaka/app/modules/buku/buku_model.dart';

class DetailPeminjaman {
  num? id;
  String? kodeTransaksi;
  Buku? buku;

  DetailPeminjaman({
    this.id,
    this.kodeTransaksi,
    this.buku,
  });

  DetailPeminjaman.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    kodeTransaksi = json['kode_transaksi'];
    buku = json['buku'] != null ? Buku?.fromJson(json['buku']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['kode_transaksi'] = kodeTransaksi;
    if (buku != null) {
      data['buku'] = buku?.toJson();
    }
    return data;
  }
}
