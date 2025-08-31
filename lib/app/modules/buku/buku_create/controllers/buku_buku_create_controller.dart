import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:tera_pustaka/app/modules/buku/buku_model.dart';
import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class BukuBukuCreateController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final judulCtrl = TextEditingController();
  final penulisCtrl = TextEditingController();
  final penerbitCtrl = TextEditingController();
  final tahunCtrl = TextEditingController();
  final isbnCtrl = TextEditingController();

  QuillController quillCtrl = QuillController.basic();

  var kategoriList = <KategoriBuku>[].obs;
  var selectedKategori = Rxn<KategoriBuku>();
  var pdfFile = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    loadKategori();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    quillCtrl.dispose();
    super.onClose();
  }

  Future<void> loadKategori() async {
    final String jsonString = await rootBundle.loadString(
      'assets/startup_data/kategori_buku.json',
    );
    final List<dynamic> data = jsonDecode(jsonString);

    kategoriList.value = data.map((e) => KategoriBuku.fromJson(e)).toList();
  }

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      pdfFile.value = File(result.files.single.path!);
    }
  }

  void saveBuku() {
    if (formKey.currentState!.validate()) {
      if (pdfFile.value != null) {
        print("PDF path: ${pdfFile.value!.path}");
      }
      final buku = Buku(
        id: DateTime.now().millisecondsSinceEpoch,
        judul: judulCtrl.text,
        penulis: penulisCtrl.text,
        penerbit: penerbitCtrl.text,
        tahunTerbit: int.tryParse(tahunCtrl.text),
        isbn: isbnCtrl.text,
        kategori: selectedKategori.value,
        ikhtisar: jsonEncode(quillCtrl.document.toDelta().toJson()),
      );

      debugPrint("📚 Buku berhasil dibuat: ${jsonEncode(buku.toJson())}");

      Get.snackbar(
        "Sukses",
        "Buku berhasil ditambahkan",
        snackPosition: SnackPosition.BOTTOM,
      );

      formKey.currentState!.reset();
      quillCtrl = QuillController.basic();
      selectedKategori.value = null;
      update();
    }
  }
}
