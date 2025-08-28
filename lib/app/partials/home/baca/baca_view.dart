import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './baca_controller.dart';

class BacaView extends GetView<BacaController> {
  const BacaView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BacaController());

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.sp),
          TextField(
            onChanged: controller.updateQuery,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEFF1F5),
              hintText: "Cari buku...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
          SizedBox(height: 20.sp),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Buku Tuk Kamu',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'Buku yang kami pilih khusus berdasarkan riwayat bacaanmu',
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  ),
                  SizedBox(height: 16.sp),
                  Obx(() {
                    return SizedBox(
                      height: 120.sp,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.recommendationBooks.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 12.sp),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100.sp,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            child: Center(
                              child: Text(
                                controller.recommendationBooks[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  SizedBox(height: 24.sp),
                  Text(
                    'Suara Buku',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'Memahami buku dengan cara yang baru',
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  ),
                  SizedBox(height: 16.sp),
                  Obx(() {
                    return SizedBox(
                      height: 120.sp,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.popularBooks.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 12.sp),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100.sp,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            child: Center(
                              child: Text(
                                controller.popularBooks[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  SizedBox(height: 24.sp),
                  Text(
                    'Journal',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'Hasil riset yang progresif dan komprehensif',
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  ),
                  SizedBox(height: 16.sp),
                  Obx(() {
                    return SizedBox(
                      height: 120.sp,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.recommendationJournals.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 12.sp),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100.sp,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            child: Center(
                              child: Text(
                                controller.recommendationJournals[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
