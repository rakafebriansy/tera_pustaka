import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppProfileMenu extends StatelessWidget {
  const AppProfileMenu({
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 24.sp,
                  backgroundColor: Colors.grey[200],
                  child: Icon(iconData),
                ),
                SizedBox(width: 12.sp,),
                Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500),)
              ],
            ),
            IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
      ),
    );
  }
}
