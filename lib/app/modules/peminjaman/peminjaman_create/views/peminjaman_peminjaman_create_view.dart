import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_peminjaman_create_controller.dart';

class PeminjamanPeminjamanCreateView
    extends GetView<PeminjamanPeminjamanCreateController> {
  const PeminjamanPeminjamanCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanPeminjamanCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PeminjamanPeminjamanCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
