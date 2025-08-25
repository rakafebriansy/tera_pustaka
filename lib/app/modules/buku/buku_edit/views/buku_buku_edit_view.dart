import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_edit_controller.dart';

class BukuBukuEditView extends GetView<BukuBukuEditController> {
  const BukuBukuEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
