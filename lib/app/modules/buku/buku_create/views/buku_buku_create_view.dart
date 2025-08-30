import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';

import '../controllers/buku_buku_create_controller.dart';

class BukuBukuCreateView extends GetView<BukuBukuCreateController> {
  const BukuBukuCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Buku")),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.judulCtrl,
                decoration: const InputDecoration(labelText: "Judul"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: controller.penulisCtrl,
                decoration: const InputDecoration(labelText: "Penulis"),
              ),
              TextFormField(
                controller: controller.penerbitCtrl,
                decoration: const InputDecoration(labelText: "Penerbit"),
              ),
              TextFormField(
                controller: controller.tahunCtrl,
                decoration: const InputDecoration(labelText: "Tahun Terbit"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: controller.isbnCtrl,
                decoration: const InputDecoration(labelText: "ISBN"),
              ),
              TextFormField(
                controller: controller.coverCtrl,
                decoration: const InputDecoration(labelText: "URL Cover"),
              ),
              SizedBox(height: 16.sp),
              Obx(
                () => DropdownButtonFormField<KategoriBuku>(
                  decoration: const InputDecoration(labelText: "Kategori"),
                  value: controller.selectedKategori.value,
                  items: controller.kategoriList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.nama ?? ""),
                        ),
                      )
                      .toList(),
                  onChanged: (val) => controller.selectedKategori.value = val,
                ),
              ),
              SizedBox(height: 20.sp),
              Text(
                "Ikhtisar",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              QuillSimpleToolbar(
                controller: controller.quillCtrl,
                config: const QuillSimpleToolbarConfig(),
              ),
              SizedBox(height: 8.sp),
              Container(
                height: 200.sp,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: QuillEditor.basic(
                  controller: controller.quillCtrl,
                  config: const QuillEditorConfig(),
                ),
              ),
              SizedBox(height: 20.sp),
              ElevatedButton.icon(
                onPressed: controller.saveBuku,
                icon: const Icon(Icons.save),
                label: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
