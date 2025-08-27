import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutBack,
          ),
        );

    animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/home');
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
