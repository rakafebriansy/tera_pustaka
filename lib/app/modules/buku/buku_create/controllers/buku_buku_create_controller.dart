import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:tera_pustaka/app/modules/buku/buku_model.dart';
import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tera_pustaka/app/utilities/database_helper.dart';
import 'package:tera_pustaka/app/utilities/kategori_repository.dart';

class BukuBukuCreateController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final judulCtrl = TextEditingController();
  final penulisCtrl = TextEditingController();
  final penerbitCtrl = TextEditingController();
  final tahunCtrl = TextEditingController();
  final isbnCtrl = TextEditingController();

  QuillController quillCtrl = QuillController.basic();
  final multiselectCtrl = MultiSelectController<KategoriBuku>();

  var pdfFile = Rxn<File>();
  var kategoriList = <DropdownItem<KategoriBuku>>[].obs;

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
    final kategoris = await KategoriRepository.allKategoris();
    final kategoriDropdowns = kategoris.map((kategori) {
      return DropdownItem(label: kategori.nama, value: kategori);
    }).toList();

    multiselectCtrl.setItems(kategoriDropdowns);
    kategoriList.value = kategoriDropdowns;
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

  Future<String> savePdfLocally(File pdfFile) async {
    final dir = await getApplicationDocumentsDirectory();
    final newPath = join(dir.path, basename(pdfFile.path));
    final newFile = await pdfFile.copy(newPath);
    return newFile.path;
  }

  void saveBuku() async {
    if (formKey.currentState!.validate()) {
      final tahun = int.parse(tahunCtrl.text);

      // handle pdf path (wajib isi, tapi kalau null kasih string kosong)
      String savedPdfPath = "";
      if (pdfFile.value != null) {
        savedPdfPath = await savePdfLocally(pdfFile.value!);
        // debugPrint("📄 PDF disimpan di: $savedPdfPath");
      }

      if (multiselectCtrl.selectedItems.isEmpty) {
        Get.snackbar(
          "Gagal",
          "Kategori buku harus dipilih",
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      final kategori = multiselectCtrl.selectedItems[0].value;

      final buku = Buku(
        id: DateTime.now().millisecondsSinceEpoch,
        judul: judulCtrl.text,
        penulis: penulisCtrl.text,
        penerbit: penerbitCtrl.text,
        tahunTerbit: tahun,
        isbn: isbnCtrl.text,
        kategori: kategori,
        ikhtisar: jsonEncode(quillCtrl.document.toDelta().toJson()),
        pdfPath: savedPdfPath,
      );

      await DatabaseHelper.insert("buku", buku.toModelJson());

      Get.snackbar(
        "Sukses",
        "Buku berhasil ditambahkan",
        snackPosition: SnackPosition.TOP,
      );

      formKey.currentState!.reset();
      quillCtrl = QuillController.basic();
      multiselectCtrl.clearAll();
      pdfFile.value = null;

      update();
    }
  }
}
