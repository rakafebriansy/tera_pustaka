import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tera_pustaka/app/components/app_pdf_cover.dart';

class AppMywritingsCard extends StatelessWidget {
  const AppMywritingsCard({
    super.key,
    required this.label,
    required this.path,
    required this.onTap,
  });

  final String label;
  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 84.sp,
        width: 100.sp,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 72.sp,
              width: 72.sp,
              child: AppPdfCover(path: path),
            ),
            Text(label, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
