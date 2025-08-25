import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kuis_kuis_edit_controller.dart';

class KuisKuisEditView extends GetView<KuisKuisEditController> {
  const KuisKuisEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KuisKuisEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KuisKuisEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
