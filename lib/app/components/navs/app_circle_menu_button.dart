import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

class AppCircleMenuButton extends StatelessWidget {
  const AppCircleMenuButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.iconData,
  });

  final GestureTapCallback onTap;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30.sp,
            backgroundColor: AppColors.secondary,
            child: Icon(iconData, color: Colors.white, size: 28.sp,),
          ),
        ),
        SizedBox(height: 4.sp,),
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
