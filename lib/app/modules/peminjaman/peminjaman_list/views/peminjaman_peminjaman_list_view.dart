import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_peminjaman_list_controller.dart';

class PeminjamanPeminjamanListView
    extends GetView<PeminjamanPeminjamanListController> {
  const PeminjamanPeminjamanListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanPeminjamanListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PeminjamanPeminjamanListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
