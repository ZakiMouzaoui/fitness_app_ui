import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/routes.dart';
import 'package:fitness_app/screens/main/tracker/meal/meal_planner_screen.dart';
import 'package:fitness_app/screens/main/tracker/workout/workout_tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class TrackerTab extends StatelessWidget {
  const TrackerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(title: 'Workout Tracker', onPressed: (){
            Get.to(()=>WorkoutTracker());
          }, padding: 12.h),
          SizedBox(height: 10.h,),
          CustomButton(title: 'Meal Planner', onPressed: (){
            Get.to(()=>MealPlannerScreen());
          }, padding: 12.h),
          SizedBox(height: 10.h,),
          CustomButton(title: 'Sleep Tracker', onPressed: (){
            Get.toNamed(AppRoutes.sleepTracker);
          }, padding: 12.h)
        ],
      ),
    );
  }
}
