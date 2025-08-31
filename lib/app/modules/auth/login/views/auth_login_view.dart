import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/forms/app_text_field.dart';
import 'package:tera_pustaka/app/routes/app_pages.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  const AuthLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(24.sp, 48.sp, 24.sp, 24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masuk',
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.sp),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: "Belum punya akun? ",
                      style: GoogleFonts.poppins(),
                    ),
                    TextSpan(
                      text: "Daftar",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAllNamed(Routes.AUTH_LOGIN);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.sp),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    label: 'Username',
                    placeholder: 'Masukkan username',
                    controller: controller.usernameCtrl,
                  ),
                  SizedBox(height: 12.sp),
                  AppTextField(
                    label: 'Password',
                    placeholder: 'Masukkan password',
                    obscure: true,
                    controller: controller.passwordCtrl,
                  ),
                  SizedBox(height: 16.sp),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.sp,
                          vertical: 12.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                      ),
                      onPressed: () {
                        Get.offAllNamed(Routes.HOME);
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
