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
    final String jsonString = await rootBundle.loadString(
      'assets/startup_data/kategori_buku.json',
    );
    final List<dynamic> data = jsonDecode(jsonString);

    var kategoris = data.map((e) {
      final kategori = KategoriBuku.fromJson(e);
      return DropdownItem(label: kategori.nama, value: kategori);
    }).toList();

    multiselectCtrl.setItems(kategoris);
    kategoriList.value = kategoris;
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
      String? savedPdfPath;

      if (pdfFile.value != null) {
        savedPdfPath = await savePdfLocally(pdfFile.value!);
        debugPrint("📄 PDF disimpan di: $savedPdfPath");
      }

      final buku = Buku(
        id: DateTime.now().millisecondsSinceEpoch,
        judul: judulCtrl.text,
        penulis: penulisCtrl.text,
        penerbit: penerbitCtrl.text,
        tahunTerbit: int.tryParse(tahunCtrl.text),
        isbn: isbnCtrl.text,
        kategori: multiselectCtrl.selectedItems[0].value,
        ikhtisar: jsonEncode(quillCtrl.document.toDelta().toJson()),
        pdfPath: savedPdfPath,
      );

      await DatabaseHelper.insert("buku", buku.toModelJson());

      // debugPrint("📚 Buku berhasil dibuat: ${jsonEncode(buku.toJson())}");

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
