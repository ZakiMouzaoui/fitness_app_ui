import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/workout_controller.dart';
import 'package:fitness_app/screens/main/home/recent_workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/workout_model.dart';

class RecentWorkouts extends StatelessWidget {
  RecentWorkouts({super.key});

  final controller = Get.put(WorkoutController());

  @override
  Widget build(BuildContext context) {
    final List<Workout> recentWorkouts = [
      controller.workouts[0],
      controller.workouts[1],
      controller.workouts[2],
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Latest Workouts",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "See more",
              style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: recentWorkouts.length,
          itemBuilder: (_, index){
            return RecentWorkoutCard(
              workout: recentWorkouts[index], ratio: 0.5,
            );
          },
          separatorBuilder: (_, __)=>SizedBox(height: 10.h,),
        )
      ],
    );
  }
}
