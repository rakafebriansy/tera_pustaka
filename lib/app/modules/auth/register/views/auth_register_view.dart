import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/forms/app_checkbox_field.dart';
import 'package:tera_pustaka/app/components/forms/app_dropdown_field.dart';
import 'package:tera_pustaka/app/components/forms/app_text_field.dart';
import 'package:tera_pustaka/app/routes/app_pages.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

import '../controllers/auth_register_controller.dart';

class AuthRegisterView extends GetView<AuthRegisterController> {
  const AuthRegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(24.sp, 48.sp, 24.sp, 24.sp),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
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
                        text: "Sudah punya akun? ",
                        style: GoogleFonts.poppins(),
                      ),
                      TextSpan(
                        text: "Masuk",
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
                      onChanged: (value) {
                        controller.username = value;
                      },
                    ),
                    SizedBox(height: 12.sp),
                    AppTextField(
                      label: 'Email',
                      placeholder: 'Masukkan email',
                      onChanged: (value) {
                        controller.email = value;
                      },
                    ),
                    SizedBox(height: 12.sp),
                    AppTextField(
                      label: 'Password',
                      placeholder: 'Masukkan password',
                      hidden: true,
                      onChanged: (value) {
                        controller.password = value;
                      },
                    ),
                    SizedBox(height: 12.sp),
                    AppTextField(
                      label: 'Konfirmasi Password',
                      placeholder: 'Masukkan konfirmasi password',
                      hidden: true,
                      onChanged: (value) {
                        controller.confirmPassword = value;
                      },
                    ),
                    SizedBox(height: 12.sp),
                    AppDropdownField(
                      label: 'Masuk Sebagai',
                      placeholder: 'Pilih salah satu',
                      items: ['Pembaca/Penulis', 'Penerbit', 'Admin'],
                      onChanged: (value) {
                        controller.role = value;
                      },
                    ),
                    SizedBox(height: 16.sp),
                    AppCheckboxField(
                      label:
                          'Saya setuju dengan syarat & ketentuan yang berlaku',
                      isChecked: controller.isCheckedTnC.value,
                      onChanged: (value) {
                        controller.isCheckedTnC.value = value;
                      },
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
                          Get.offAllNamed(Routes.AUTH_LOGIN);
                        },
                        child: Text(
                          "Daftar",
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
            );
          }),
        ),
      ),
    );
  }
}
