import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_kategori_create_controller.dart';

class BukuBukuKategoriCreateView
    extends GetView<BukuBukuKategoriCreateController> {
  const BukuBukuKategoriCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuKategoriCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuKategoriCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
