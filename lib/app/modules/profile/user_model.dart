class User {
  num? id;
  String? nama;
  String? email;
  String? role;
  String? password;

  User({
    this.id,
    this.nama,
    this.email,
    this.role,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    nama = json['nama'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['role'] = role;
    data['password'] = password;
    return data;
  }
}
