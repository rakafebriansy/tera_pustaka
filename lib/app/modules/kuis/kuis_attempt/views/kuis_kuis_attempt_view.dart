import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kuis_kuis_attempt_controller.dart';

class KuisKuisAttemptView extends GetView<KuisKuisAttemptController> {
  const KuisKuisAttemptView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KuisKuisAttemptView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KuisKuisAttemptView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
