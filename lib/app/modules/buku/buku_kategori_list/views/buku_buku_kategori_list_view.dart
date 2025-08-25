import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_kategori_list_controller.dart';

class BukuBukuKategoriListView extends GetView<BukuBukuKategoriListController> {
  const BukuBukuKategoriListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuKategoriListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuKategoriListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
