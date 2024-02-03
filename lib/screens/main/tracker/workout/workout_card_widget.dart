import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WorkoutCardWidget extends StatelessWidget {
  const WorkoutCardWidget({super.key, required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor1.withOpacity(0.15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.name,
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${workout.numExercises} Exercises | ${workout.duration} mins",
                        style: TextStyle(
                            color: AppColors.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        Get.toNamed(AppRoutes.workoutDetails,
                            arguments: {"workout": workout});
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(color: AppColors.primaryColor1),
                      ))
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white,
                  image: DecorationImage(image: CachedNetworkImageProvider(workout.img), fit: BoxFit.cover)
                ),
                height: 100.h,
                width: 100.w,
              )
            ],
          ),
        ],
      ),
    );
  }
}
