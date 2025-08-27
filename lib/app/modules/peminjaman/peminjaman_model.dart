class Peminjaman {
  String? kodeTransaksi;
  User? user;
  String? tanggalPinjam;
  dynamic tanggalKembali;
  String? status;

  Peminjaman({
    this.kodeTransaksi,
    this.user,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
  });

  Peminjaman.fromJson(Map<String, dynamic> json) {
    kodeTransaksi = json['kode_transaksi'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kode_transaksi'] = kodeTransaksi;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['tanggal_pinjam'] = tanggalPinjam;
    data['tanggal_kembali'] = tanggalKembali;
    data['status'] = status;
    return data;
  }
}

class User {
  num? id;
  String? nama;
  String? email;
  String? role;

  User({
    this.id,
    this.nama,
    this.email,
    this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    nama = json['nama'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
