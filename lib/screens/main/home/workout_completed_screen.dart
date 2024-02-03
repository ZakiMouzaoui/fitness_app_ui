import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class WorkoutCompletedScreen extends StatelessWidget {
  const WorkoutCompletedScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/img/complete_workout.png")),
            Expanded(child: Column(
              children: [
                Text("Congratulations, You Have Finished Your Workout", style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ), textAlign: TextAlign.center),
                SizedBox(height: 15.h,),
                Text("Exercises is king and nutrition is queen. Combine the two and you will have a kingdom\n-Jack Lalanne", style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ), textAlign: TextAlign.center,),
                const Spacer(),
                CustomButton(title: "Back To Home", onPressed: (){
                  Get.offAllNamed(AppRoutes.main);
                })
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
