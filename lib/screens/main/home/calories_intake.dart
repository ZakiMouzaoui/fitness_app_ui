import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../constants/colors.dart';

class CaloriesIntake extends StatelessWidget {
  const CaloriesIntake({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightGray, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 140.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Calories", style: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 5.h,),
          Text("760 kCal", style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryColor1,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 15.h,),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SimpleCircularProgressBar(
                  size: 80,
                  animationDuration: 1,
                  backColor: AppColors.lightGray,
                  fullProgressColor: AppColors.primaryColor1,
                  progressColors: AppColors.primaryG,
                  startAngle: 20,
                  valueNotifier: ValueNotifier(
                      80
                  ),
                  progressStrokeWidth: 10,
                  backStrokeWidth: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: AppColors.primaryG
                    )
                  ),
                  child: Text("230 kCal\n left", style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
