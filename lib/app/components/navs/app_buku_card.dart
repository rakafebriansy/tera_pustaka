import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/app_pdf_cover.dart';

class AppBukuCard extends StatelessWidget {
  const AppBukuCard({super.key, required this.onTap, required this.path});

  final GestureTapCallback onTap;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.sp,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(child: AppPdfCover(path: path)),
      ),
    );
  }
}
