import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/progress_controller.dart';
import 'package:fitness_app/helpers/utils_functions.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ComparisonResultsScreen extends StatelessWidget {
  ComparisonResultsScreen({super.key});

  final controller = Get.put(ProgressController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            const CustomAppBar(title: "Results"),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.separated(
                //shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.filteredImgGroups.length,
                itemBuilder: (_, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatProgressDate(
                          controller.filteredImgGroups[index].date),
                      style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h),
                      itemBuilder: (_, index2) {
                        final imgPath =
                            controller.imgGroups[index].imagePaths[index2];
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    imgPath,
                                  ),
                                  fit: BoxFit.cover)),
                        );
                      },
                      itemCount: controller.imgGroups[index].imagePaths.length,
                    ),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 15.h,
                ),
              ),
            ),
            CustomButton(
                title: "Back to Home",
                onPressed: () {
                  Get.offAllNamed(AppRoutes.main);
                })
          ],
        ),
      ),
    ));
  }
}
