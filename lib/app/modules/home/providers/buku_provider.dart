import 'package:get/get.dart';

import '../buku_model.dart';

class BukuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Buku.fromJson(map);
      if (map is List) return map.map((item) => Buku.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Buku?> getBuku(int id) async {
    final response = await get('buku/$id');
    return response.body;
  }

  Future<Response<Buku>> postBuku(Buku buku) async => await post('buku', buku);
  Future<Response> deleteBuku(int id) async => await delete('buku/$id');
}
