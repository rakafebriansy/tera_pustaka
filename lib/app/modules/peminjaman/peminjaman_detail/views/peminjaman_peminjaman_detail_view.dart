import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_peminjaman_detail_controller.dart';

class PeminjamanPeminjamanDetailView
    extends GetView<PeminjamanPeminjamanDetailController> {
  const PeminjamanPeminjamanDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanPeminjamanDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PeminjamanPeminjamanDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
