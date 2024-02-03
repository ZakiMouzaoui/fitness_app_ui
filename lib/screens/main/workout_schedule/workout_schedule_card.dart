import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/models/workout_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../helpers/utils_functions.dart';

class WorkoutScheduleCard extends StatelessWidget {
  const WorkoutScheduleCard({super.key, required this.workoutSchedule});

  final WorkoutSchedule workoutSchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.primaryG),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(workoutSchedule.workout.img),
                  fit: BoxFit.cover
                )
              ),
              width: 60.w,
              height: 70.h,
              ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workoutSchedule.workout.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 20,),
                  SizedBox(width: 5.w,),
                  Text(
                    formatScheduleDate(workoutSchedule.date),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
