import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodNutritionCard extends StatelessWidget {
  const FoodNutritionCard({super.key, required this.amount, required this.iconPath, this.unit, required this.nutriment});
  
  final int amount;
  final String nutriment;
  final String iconPath;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor1.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset("assets/img/$iconPath", width: 20.w, height: 20.h,),
          SizedBox(width: 5.w,),
          Text("$amount${unit ?? ""} $nutriment", style: TextStyle(
            color: AppColors.gray,
            fontSize: 12
          ),)
        ],
      ),
    );
  }
}
