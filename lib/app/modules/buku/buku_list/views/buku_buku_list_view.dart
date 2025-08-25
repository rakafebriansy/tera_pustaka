import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_buku_list_controller.dart';

class BukuBukuListView extends GetView<BukuBukuListController> {
  const BukuBukuListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuBukuListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuBukuListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
