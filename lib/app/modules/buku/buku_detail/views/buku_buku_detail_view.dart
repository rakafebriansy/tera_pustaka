import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_detail_controller.dart';

class BukuBukuDetailView extends GetView<BukuBukuDetailController> {
  const BukuBukuDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
