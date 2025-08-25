import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kuis_kuis_list_controller.dart';

class KuisKuisListView extends GetView<KuisKuisListController> {
  const KuisKuisListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KuisKuisListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KuisKuisListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
