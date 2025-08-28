import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  final List<Widget> _pages = const [
    Center(child: Text("Beranda Page")),
    Center(child: Text("Nulis Page")),
    Center(child: Text("Misi Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Obx(() => _pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changePage,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Beranda"),
            NavigationDestination(icon: Icon(Icons.edit), label: "Nulis"),
            NavigationDestination(icon: Icon(Icons.star), label: "Misi"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
