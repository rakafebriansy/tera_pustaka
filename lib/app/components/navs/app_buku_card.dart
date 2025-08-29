import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBukuCard extends StatelessWidget {
  const AppBukuCard({
    super.key,
    required this.onTap,
    required this.label,
  });

  final GestureTapCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.sp,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(
          child: Text(label, style: GoogleFonts.poppins(color: Colors.white)),
        ),
      ),
    );
  }
}
