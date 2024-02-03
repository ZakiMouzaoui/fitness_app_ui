import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/main_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Map<String, dynamic>> navItems = [
    {
      "label": "Home",
      "icon": Icons.home,
    },
    {
      "label": "Tracker",
      "icon": Icons.stacked_line_chart
    },
    {
      "label": "Progress",
      "icon": Icons.photo_camera_rounded
    },
    {
      "label": "Profile",
      "icon": Icons.person
    },
  ];

  final controller = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      child: SafeArea(
          child: GetBuilder<MainViewController>(
            builder: (_)=> Scaffold(
              body: controller.screens[controller.currentIndex],
                floatingActionButton: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: AppColors.primaryG),
                        shape: BoxShape.circle),
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniCenterDocked,
                bottomNavigationBar: BottomAppBar(
                      color: Colors.white,
                      shadowColor: AppColors.gray,
                      surfaceTintColor: Colors.white,
                      shape: CircularNotchedRectangle(),
                      notchMargin: 8,
                      elevation: 100,
                      height: 70.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        //children inside bottom appbar
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) => GetBuilder<MainViewController>(
                          builder: (_)=> IconButton(
                            onPressed: (){
                              controller.changeIndex(index);
                            },
                            icon: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(navItems[index]["icon"] as IconData, color: index == controller.currentIndex ? AppColors.primaryColor1 : AppColors.gray,),
                                Text(navItems[index]["label"] as String, style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: controller.currentIndex == index ? AppColors.primaryColor1 :  AppColors.gray
                                ),)
                              ],
                            ),
                          ),
                        ),)
                      )),
                ),
          )),
    );
  }
}
