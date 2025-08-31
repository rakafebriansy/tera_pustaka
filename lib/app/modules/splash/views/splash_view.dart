import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

import '../controllers/splash_controller.dart';
import '../../../utilities/assets_manager.dart' as assets;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: controller.slideAnimation,
                  child: SizedBox(
                    height: 160.sp,
                    child: Image.asset(assets.AssetsManager.splash),
                  ),
                ),
                SizedBox(height: 16.sp),
                Text(
                  'Tera Pustaka',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    fontSize: 36.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
