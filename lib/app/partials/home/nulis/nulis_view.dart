import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tera_pustaka/app/components/navs/app_circle_menu_button.dart';
import 'package:tera_pustaka/app/components/navs/app_mywritings_card.dart';
import 'package:tera_pustaka/app/routes/app_pages.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';
import './nulis_controller.dart';

class NulisView extends GetView<NulisController> {
  const NulisView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NulisController());

    return Scaffold(
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.sp),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: controller.updateQuery,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFF1F5),
                      hintText: "Cari buku...",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.sp),
                GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondary,
                    child: Icon(Icons.add, color: Colors.white, weight: 2),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.BUKU_BUKU_CREATE);
                  },
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppCircleMenuButton(
                    onTap: () {},
                    label: 'Audiobook',
                    iconData: Icons.mic,
                  ),
                ),
                Expanded(
                  child: AppCircleMenuButton(
                    onTap: () {},
                    label: 'Buku',
                    iconData: Icons.book,
                  ),
                ),
                Expanded(
                  child: AppCircleMenuButton(
                    onTap: () {},
                    label: 'Review',
                    iconData: Icons.collections_bookmark,
                  ),
                ),
                Expanded(
                  child: AppCircleMenuButton(
                    onTap: () {},
                    label: 'Jurnal',
                    iconData: Icons.description,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.myWritingBooks.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.sp),
                itemBuilder: (context, index) {
                  return AppMywritingsCard(
                    onTap: () {
                      Get.toNamed(
                        Routes.BUKU_BUKU_DETAIL,
                        arguments: controller.myWritingBooks[index],
                      );
                    },
                    label: controller.myWritingBooks[index].judul,
                    path: controller.myWritingBooks[index].pdfPath,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
