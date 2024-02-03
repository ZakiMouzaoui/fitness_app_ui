import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/notifications_controller.dart';
import 'package:fitness_app/screens/notifications/notification_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
              children: [
                const CustomAppBar(
                  title: "Notifications",
                ),
                SizedBox(
                  height: 35.h,
                ),
                Expanded(
                  child: ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (_, index)=>NotificationTileWidget(notificationModel: controller.notifications[index]),
                          separatorBuilder: (_, __)=>Divider(
                            color: AppColors.gray.withOpacity(0.1),
                            thickness: 2,
                            height: 20.h,
                          ),
                          itemCount: controller.notifications.length),
                ),

              ],
            ),
          ),
      ),
    );
  }
}
