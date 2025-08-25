import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_create_controller.dart';

class BukuBukuCreateView extends GetView<BukuBukuCreateController> {
  const BukuBukuCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
