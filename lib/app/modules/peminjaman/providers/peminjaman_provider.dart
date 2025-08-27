import 'package:get/get.dart';

import '../peminjaman_model.dart';

class PeminjamanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Peminjaman.fromJson(map);
      if (map is List)
        return map.map((item) => Peminjaman.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Peminjaman?> getPeminjaman(int id) async {
    final response = await get('peminjaman/$id');
    return response.body;
  }

  Future<Response<Peminjaman>> postPeminjaman(Peminjaman peminjaman) async =>
      await post('peminjaman', peminjaman);
  Future<Response> deletePeminjaman(int id) async =>
      await delete('peminjaman/$id');
}
