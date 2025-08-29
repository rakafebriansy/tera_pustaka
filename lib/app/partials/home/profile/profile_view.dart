import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tera_pustaka/app/components/navs/app_profile_menu.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';
import './profile_controller.dart';
import '../../../assets_manager.dart' as assets;
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.sp),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: AppColors.secondary,
            ),
            padding: EdgeInsets.all(14.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      child: Image.asset(assets.AssetsManager.user),
                      radius: 28.sp,
                    ),
                    SizedBox(width: 14.sp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Akmal',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '@akmal',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.sp),
          Text(
            'Personalisasi',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 12.sp),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppProfileMenu(
                onTap: () {},
                label: 'Perpustakaan Saya',
                iconData: Icons.my_library_books,
              ),
              SizedBox(height: 12.sp),
              AppProfileMenu(
                onTap: () {},
                label: 'Riwayat',
                iconData: Icons.history,
              ),
              SizedBox(height: 12.sp),
            ],
          ),
          SizedBox(height: 24.sp),
          Text(
            'Aplikasi',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 12.sp),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppProfileMenu(
                onTap: () {},
                label: 'Pengaturan',
                iconData: Icons.settings,
              ),
              AppProfileMenu(
                onTap: () {},
                label: 'Bantuan',
                iconData: Icons.help,
              ),
              SizedBox(height: 12.sp),
              AppProfileMenu(
                onTap: () {},
                label: 'Tentang',
                iconData: Icons.info,
              ),
            ],
          ),
          SizedBox(height: 24.sp),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
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
                "Keluar",
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
    );
  }
}
