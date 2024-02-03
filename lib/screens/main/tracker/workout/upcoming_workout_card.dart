import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/common_widgets/switch_button.dart';
import 'package:fitness_app/helpers/utils_functions.dart';
import 'package:fitness_app/models/workout_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors.dart';

class UpComingWorkoutCard extends StatelessWidget {
  const UpComingWorkoutCard(
      {super.key, required this.schedule});

  final WorkoutSchedule schedule;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: ()=>Get.toNamed(AppRoutes.workoutComplete),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Colors.grey.withOpacity(0.15), width: 1.5)),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor1.withOpacity(0.3),
                  backgroundImage: CachedNetworkImageProvider(schedule.workout.img),
                  radius: 30,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule.workout.name,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      formatScheduleDate(schedule.date),
                      style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                )
              ],
            )),
            SizedBox(
              width: 8.w,
            ),
            const SwitchButton()
          ],
        ),
      ),
    );
  }
}
