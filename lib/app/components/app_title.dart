import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

class AppTitle extends StatelessWidget {
  AppTitle({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tera Pustaka',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
        fontSize: this.size ?? 36.sp,
      ),
    );
  }
}
