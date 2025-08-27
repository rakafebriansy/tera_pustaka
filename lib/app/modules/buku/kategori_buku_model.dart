class KategoriBuku {
  num? id;
  String? nama;

  KategoriBuku({
    this.id,
    this.nama,
  });

  KategoriBuku.fromJson(Map<String, dynamic> json) {
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
