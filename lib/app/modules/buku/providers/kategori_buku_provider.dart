import 'package:get/get.dart';

import '../kategori_buku_model.dart';

class KategoriBukuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return KategoriBuku.fromJson(map);
      if (map is List)
        return map.map((item) => KategoriBuku.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<KategoriBuku?> getKategoriBuku(int id) async {
    final response = await get('kategoribuku/$id');
    return response.body;
  }

  Future<Response<KategoriBuku>> postKategoriBuku(
          KategoriBuku kategoribuku) async =>
      await post('kategoribuku', kategoribuku);
  Future<Response> deleteKategoriBuku(int id) async =>
      await delete('kategoribuku/$id');
}
