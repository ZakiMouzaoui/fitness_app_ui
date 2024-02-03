import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/screens/main/tracker/meal/food_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class FoodCardWidget extends StatelessWidget {
  const FoodCardWidget({super.key, required this.food, required this.index});

  final Food food;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index%2 == 0 ? AppColors.primaryColor1.withOpacity(0.2) : AppColors.secondaryColor1.withOpacity(0.2)
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(tag: food.name, child: CircleAvatar(radius: 50, backgroundColor: Colors.white, backgroundImage: CachedNetworkImageProvider(food.img),)),
          SizedBox(height: 10.h,),
          Text(food.name, style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13
              ),
            textAlign: TextAlign.center,
            ),
          SizedBox(height: 3.h,),
          Text("${food.totalCalories} kCal", style: TextStyle(
            color: AppColors.gray,
            fontSize: 12
          ),),
          SizedBox(height: 5.h,),
          //const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (){
              Get.to(()=>FoodDetailsScreen(food: food));
            },
            child: Container(
              width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: index%2 == 0 ? AppColors.primaryG : AppColors.secondaryG
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Text(
                "View",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
