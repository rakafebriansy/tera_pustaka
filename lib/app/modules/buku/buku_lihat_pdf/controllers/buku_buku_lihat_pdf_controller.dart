import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class BukuBukuLihatPdfController extends GetxController {
  late final PdfController pdfController;
  final TextEditingController searchController = TextEditingController();

  var currentPage = 1.obs;
  var totalPages = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final String pdfPath = Get.arguments as String;
    pdfController = PdfController(
      document: PdfDocument.openFile(pdfPath),
      initialPage: 1,
    );
  }

  @override
  void onClose() {
    pdfController.dispose();
    super.onClose();
  }
}
