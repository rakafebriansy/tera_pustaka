import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/partials/home/baca/baca_view.dart';

import '../controllers/home_controller.dart';
import '../../../assets_manager.dart' as assets;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  final List<Widget> _pages = const [
    BacaView(),
    Center(child: Text("Nulis Page")),
    Center(child: Text("Misi Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selamat datang, Akmal! 👋',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  CircleAvatar(child: Image.asset(assets.AssetsManager.user)),
                ],
              ),
              Expanded(child: Obx(() => _pages[controller.currentIndex.value])),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changePage,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Baca"),
            NavigationDestination(icon: Icon(Icons.edit), label: "Nulis"),
            NavigationDestination(icon: Icon(Icons.star), label: "Misi"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
