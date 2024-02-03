import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SleepAmount extends StatelessWidget {
  const SleepAmount({super.key});

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
          Text("Sleep", style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 5.h,),
          Text("8h 20m", style: TextStyle(
              fontSize: 14,
            color: AppColors.primaryColor1,
            fontWeight: FontWeight.w600
          ),),
          Expanded(child: Image.asset("assets/img/sleep_grap.png", width: double.infinity,))

        ],
      ),
    );
  }
}
