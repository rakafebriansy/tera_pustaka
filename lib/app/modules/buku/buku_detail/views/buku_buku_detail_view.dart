import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/charts/app_detail_buku_info_card.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

import '../controllers/buku_buku_detail_controller.dart';

class BukuBukuDetailView extends GetView<BukuBukuDetailController> {
  const BukuBukuDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> book = {
      "judul": "Ksatria, Putri, dan Bintang Jatuh",
      "penulis": "Dee Lestari",
      "tahun": "2023",
      "dilihat": "400",
      "kategori": "Novel",
      "penerbit": "ElexMedia",
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ksatria, Putri, dan Bintang Jatuh',
          style: GoogleFonts.poppins(),
        ),
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
                Container(
                  color: Colors.grey[300],
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
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
                      label: book['penulis']!,
                      iconData: Icons.person_outline,
                    ),
                    AppDetailBukuInfoCard(
                      label: book['tahun']!,
                      iconData: Icons.calendar_month_outlined,
                    ),
                    AppDetailBukuInfoCard(
                      label: book['dilihat']!,
                      iconData: Icons.remove_red_eye_outlined,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Preview',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.sp),
                SizedBox(
                  height: 160.sp,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\"Aku tahu sekarang, lebih banyak luka di hati bapakku dibanding di tubuhnya. Juga mamakku, lebih banyak tangis di hati Mamak dibanding di matanya."Sebuah kisah tentang perjalanan pulang, melalui pertarungan demi pertarungan, untuk memeluk erat semua kebencian dan rasa sakit.\"\nNovel Ksatria, Putri, dan Bintang Jatuh karya Dee Lestari menghadirkan kisah persahabatan, cinta, dan perjalanan menemukan jati diri yang dibalut dengan nuansa remaja yang hangat. Cerita ini berfokus pada tiga tokoh utama dengan latar kehidupan sekolah, mimpi, serta konflik yang dekat dengan pembaca muda. Dee berhasil menghidupkan karakter-karakter dengan dialog yang segar dan alur yang mengalir ringan namun tetap sarat makna. Pesan moral tentang keberanian meraih cita-cita, menghargai persahabatan, dan ketulusan hati membuat novel ini relevan untuk segala kalangan. Sebuah bacaan inspiratif yang layak diapresiasi.',
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
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
                onPressed: () {},
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
