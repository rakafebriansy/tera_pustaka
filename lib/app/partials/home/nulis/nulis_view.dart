import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/components/navs/app_circle_menu_button.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';
import './nulis_controller.dart';

class NulisView extends GetView<NulisController> {
  const NulisView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NulisController());

    return Scaffold(
      body: Column(
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
                onTap: () {},
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
              itemCount: controller.myWritings.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 12.sp),
              itemBuilder: (context, index) {
                return Container(
                  height: 84.sp,
                  width: 100.sp,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Center(
                    child: Text(
                      controller.myWritings[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
