import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_kategori_edit_controller.dart';

class BukuBukuKategoriEditView extends GetView<BukuBukuKategoriEditController> {
  const BukuBukuKategoriEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuKategoriEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuKategoriEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
