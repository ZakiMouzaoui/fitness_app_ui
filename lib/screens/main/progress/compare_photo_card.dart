import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ComparePhotoCard extends StatelessWidget {
  const ComparePhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor1.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        children: [
          Text("Compare my photo", style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),),
          const Spacer(),
          CustomButton(title: 'Compare', onPressed: (){
            Get.toNamed(AppRoutes.comparison);
          }, width: 90.w, padding: 8.h, fontSize: 11,)
        ],
      ),
    );
  }
}
