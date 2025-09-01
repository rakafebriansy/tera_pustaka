import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/buku_buku_lihat_pdf_controller.dart';

class BukuBukuLihatPdfView extends GetView<BukuBukuLihatPdfController> {
  const BukuBukuLihatPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 60.sp,
            child: TextField(
              controller: controller.searchController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: "Pg",
                contentPadding: EdgeInsets.symmetric(vertical: 0.sp),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (val) {
                final page = int.tryParse(val) ?? 1;
                debugPrint(page.toString());
                if (page > 0 && page <= controller.totalPages.value) {
                  controller.pdfController.jumpToPage(page);
                  controller.currentPage.value = page;
                } else {
                  Get.snackbar("Error", "Halaman tidak tersedia");
                }
              },
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Text(
                "${controller.currentPage.value} / ${controller.totalPages.value}",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              controller.pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              controller.pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200),
              );
            },
          ),
        ],
      ),
      body: PdfView(
        controller: controller.pdfController,
        scrollDirection: Axis.vertical,
        onDocumentLoaded: (document) {
          controller.totalPages.value = document.pagesCount;
        },
        onPageChanged: (page) {
          controller.currentPage.value = page;
        },
      ),
    );
  }
}
