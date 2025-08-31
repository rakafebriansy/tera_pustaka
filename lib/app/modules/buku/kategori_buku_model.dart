class KategoriBuku {
  num id;
  String nama;

  KategoriBuku({required this.id, required this.nama});

  factory KategoriBuku.fromJson(Map<String, dynamic> json) {
    return KategoriBuku(id: json['id'] as int, nama: json['nama'] as String);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}
