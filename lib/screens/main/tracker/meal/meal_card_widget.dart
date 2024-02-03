import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/screens/main/tracker/meal/meal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MealCardWidget extends StatelessWidget {
  const MealCardWidget({super.key, required this.index, required this.meal});

  final int index;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: index % 2 == 0
                    ? AppColors.primaryColor1.withOpacity(0.2)
                    : AppColors.secondaryColor1.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(meal.name, style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                ),),
                Text("${meal.foods.length} foods", style: TextStyle(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                  fontSize: 12
                ),),
                SizedBox(height: 5.h,),
                CustomButton(title: "Select", onPressed: (){
                  Get.to(()=>MealDetailsScreen(meal: meal));
                }, padding: 4.h, width: 100.w, gradient: index%2 == 0 ? AppColors.primaryG : AppColors.secondaryG,)
              ],
            ),
          ),
          Positioned(
              child: CachedNetworkImage(imageUrl: meal.icon, width: 80.w, height: 80.h,)
          ),
        ],
      ),
    );
  }
}
