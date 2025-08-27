import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tera_pustaka/app/partials/onboarding/first_onboarding_view.dart';
import 'package:tera_pustaka/app/partials/onboarding/second_onboarding_view.dart';
import 'package:tera_pustaka/app/routes/app_pages.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: controller.onPageChanged,
                  controller: controller.pageController,
                  children: const [
                    Center(child: FirstOnboardingView()),
                    Center(child: SecondOnboardingView()),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: 2,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: AppColors.primary,
                  dotColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                if (controller.currentPage.value == 0) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Icon(
                        Icons.arrow_circle_right_rounded,
                        size: 60.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.sp,
                              vertical: 12.sp,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.sp),
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(Routes.AUTH_LOGIN);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.sp,
                              vertical: 12.sp,
                            ),
                            side: BorderSide(
                              width: 4.sp,
                              color: AppColors.primary
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.sp),
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(Routes.AUTH_REGISTER);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
