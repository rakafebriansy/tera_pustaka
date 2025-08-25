import 'package:get/get.dart';

import '../detail_peminjaman_model.dart';

class DetailPeminjamanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return DetailPeminjaman.fromJson(map);
      if (map is List)
        return map.map((item) => DetailPeminjaman.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<DetailPeminjaman?> getDetailPeminjaman(int id) async {
    final response = await get('detailpeminjaman/$id');
    return response.body;
  }

  Future<Response<DetailPeminjaman>> postDetailPeminjaman(
          DetailPeminjaman detailpeminjaman) async =>
      await post('detailpeminjaman', detailpeminjaman);
  Future<Response> deleteDetailPeminjaman(int id) async =>
      await delete('detailpeminjaman/$id');
}
