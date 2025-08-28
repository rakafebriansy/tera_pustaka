import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tera_pustaka/app/components/navs/app_circle_menu_button.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';
import './misi_controller.dart';

class MisiView extends GetView<MisiController> {
  const MisiView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MisiController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(text: 'Misi Akan Datang'),
                  Tab(text: 'Misi Diselesaikan'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: controller.myOngoingMissions.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.abc),
                      Text(controller.myOngoingMissions[index]),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [Text(controller.myOngoingMissions[index])],
                      ),
                    ),
                  ],
                );
              },
            ),
            Center(child: Text('Buku Page')),
          ],
        ),
      ),
    );
  }
}
