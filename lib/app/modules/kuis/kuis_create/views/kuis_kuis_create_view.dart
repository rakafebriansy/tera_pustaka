import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kuis_kuis_create_controller.dart';

class KuisKuisCreateView extends GetView<KuisKuisCreateController> {
  const KuisKuisCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KuisKuisCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KuisKuisCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
