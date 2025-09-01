import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/app_pdf_cover.dart';
import 'package:tera_pustaka/app/components/charts/app_detail_buku_info_card.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';
import '../controllers/buku_buku_detail_controller.dart';

class BukuBukuDetailView extends GetView<BukuBukuDetailController> {
  const BukuBukuDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final buku = controller.buku;

    return Scaffold(
      appBar: AppBar(
        title: Text(buku.judul, style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: AppPdfCover(path: buku.pdfPath),
                ),
                SizedBox(height: 24.sp),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.sp,
                  mainAxisSpacing: 10.sp,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 16 / 9,
                  children: [
                    AppDetailBukuInfoCard(
                      label: buku.penulis,
                      iconData: Icons.person_outline,
                    ),
                    AppDetailBukuInfoCard(
                      label: buku.tahunTerbit.toString(),
                      iconData: Icons.calendar_month_outlined,
                    ),
                    AppDetailBukuInfoCard(
                      label: "0",
                      iconData: Icons.remove_red_eye_outlined,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ikhtisar',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.sp),
                SizedBox(
                  height: 160.sp,
                  child: QuillEditor(
                    controller: QuillController(
                      document: Document.fromJson(jsonDecode(buku.ikhtisar)),
                      selection: const TextSelection.collapsed(offset: 0),
                    ),
                    focusNode: FocusNode(),
                    scrollController: ScrollController(),
                  ),
                ),
              ],
            ),

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
                  // Navigasi ke halaman baca PDF
                },
                child: Text(
                  "Baca",
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
      ),
    );
  }
}
