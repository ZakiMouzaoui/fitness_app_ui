import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/screens/main/tracker/meal/food_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class FoodScheduleCard extends StatelessWidget {
  const FoodScheduleCard({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>FoodDetailsScreen(food: food)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primaryColor1.withOpacity(0.15),
            ),
            child: CachedNetworkImage(imageUrl: food.img, width: 50.w, height: 50.h, imageBuilder: (_, provider)=>CircleAvatar(
              backgroundImage: provider,
            ),),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(food.name, style: TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),),
              Text("${food.totalCalories}Kcal", style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w400
              ),)
            ],
          )
        ],
      ),
    );
  }
}
