import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../../models/workout_model.dart';


class RecentWorkoutCard extends StatelessWidget {
  const RecentWorkoutCard({super.key, required this.workout, required this.ratio});

  final Workout workout;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.toNamed(AppRoutes.workoutComplete),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.15), width: 1.5)
        ),
        child: Row(
          children: [
           Expanded(child: Row(
             children: [
               CircleAvatar(
                 backgroundColor: AppColors.primaryColor1.withOpacity(0.3),
                 backgroundImage: CachedNetworkImageProvider(workout.img),
                 radius: 30,
               ),
               SizedBox(width: 10.w,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(workout.name, style: TextStyle(
                       color: AppColors.black,
                       fontSize: 14,
                       fontWeight: FontWeight.w500
                   ),),
                   SizedBox(height: 3.h,),
                   SizedBox(
                     width: 200.w,
                     child: Text('${workout.caloriesBurned.toInt()} calories burn | ${workout.duration} minutes', style: TextStyle(
                         color: AppColors.gray,
                         fontSize: 12,
                         fontWeight: FontWeight.w400
                     ), overflow: TextOverflow.ellipsis,),
                   ),
                   SizedBox(height: 5.h,),
                   SimpleAnimationProgressBar(
                     height: 12.h,
                     width: 200.w,
                     backgroundColor: AppColors.lightGray,
                     foregrondColor: AppColors.primaryColor1,
                     ratio: ratio,
                     direction: Axis.horizontal,
                     curve: Curves.fastLinearToSlowEaseIn,
                     duration: const Duration(seconds: 3),
                     borderRadius: BorderRadius.circular(20),
                     gradientColor: LinearGradient(
                         colors: AppColors.primaryG
                     ),
                   )
                 ],
               )
             ],
           )),
            SizedBox(width: 10.w,),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondaryColor1)
              ),
              child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.secondaryColor1, size: 16,),
            )
          ],
        ),
      ),
    );
  }
}
