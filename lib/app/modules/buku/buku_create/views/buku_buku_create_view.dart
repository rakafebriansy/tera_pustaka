import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/forms/app_text_field.dart';
import 'package:tera_pustaka/app/modules/buku/kategori_buku_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

import '../controllers/buku_buku_create_controller.dart';

class BukuBukuCreateView extends GetView<BukuBukuCreateController> {
  const BukuBukuCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Buku"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              AppTextField(
                controller: controller.judulCtrl,
                label: 'Judul',
                placeholder: 'Masukkan Judul',
                rules: 'required',
              ),
              SizedBox(height: 16.sp),
              AppTextField(
                controller: controller.penulisCtrl,
                label: 'Penulis',
                placeholder: 'Masukkan Penulis',
                rules: 'required',
              ),
              SizedBox(height: 16.sp),
              AppTextField(
                controller: controller.penerbitCtrl,
                label: 'Penerbit',
                placeholder: 'Masukkan Penerbit',
                rules: 'required',
              ),
              SizedBox(height: 16.sp),
              AppTextField(
                controller: controller.tahunCtrl,
                label: 'Tahun Terbit',
                placeholder: 'Masukkan Tahun Terbit',
                keyboardType: TextInputType.number,
                rules: 'required',
              ),
              SizedBox(height: 16.sp),
              AppTextField(
                controller: controller.isbnCtrl,
                label: 'ISBN',
                placeholder: 'Masukkan ISBN',
                rules: 'required',
              ),
              SizedBox(height: 16.sp),
              Text('Kategori', style: GoogleFonts.poppins(fontSize: 16.sp)),
              SizedBox(height: 4.sp),
              Obx(
                () => DropdownButtonFormField2<KategoriBuku>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  isExpanded: true,
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
                  dropdownStyleData: DropdownStyleData(maxHeight: 200.sp),
                ),
              ),
              SizedBox(height: 16.sp),
              Text('File Buku', style: GoogleFonts.poppins(fontSize: 16.sp)),
              OutlinedButton.icon(
                onPressed: controller.pickPdf,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                icon: const Icon(Icons.upload_file),
                label: Text("Unggah PDF", style: GoogleFonts.poppins()),
              ),
              if (controller.pdfFile.value != null)
                Padding(
                  padding: EdgeInsets.only(top: 8.sp),
                  child: Text(
                    "Dipilih: ${controller.pdfFile.value!.path.split('/').last}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              SizedBox(height: 20.sp),
              Text('Ikhtisar', style: GoogleFonts.poppins(fontSize: 16.sp)),
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
                onPressed: controller.saveBuku,
                icon: const Icon(Icons.save, color: Colors.white),
                label: Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
