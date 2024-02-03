import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/workout_controller.dart';
import 'package:fitness_app/controllers/workout_schedule_controller.dart';
import 'package:fitness_app/screens/main/home/progress_chart_widget.dart';
import 'package:fitness_app/screens/main/tracker/workout/upcoming_workout_card.dart';
import 'package:fitness_app/screens/main/tracker/workout/workout_card_widget.dart';
import 'package:fitness_app/screens/main/workout_schedule/workout_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/custom_button.dart';

class WorkoutTracker extends StatelessWidget {
  WorkoutTracker({super.key});

  final controller = Get.put(WorkoutController());
  final scheduleCtr = Get.put(WorkoutScheduleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: AppColors.primaryG)),
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.black,
                        size: 16,
                      ),
                    ),
                  ),
                  const Text(
                    "Workout Tracker",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.more_horiz_rounded,
                      color: AppColors.black,
                      size: 16,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            SliverAppBar(
              centerTitle: true,
              expandedHeight: 180.h,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 180.h,
                child: const ProgressChartWidget(
                  chartColor: Colors.white,
                ),
              ),
            ),
          ],
          body: Container(

              margin: EdgeInsets.only(top: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 55.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            color: AppColors.gray.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.primaryColor1.withOpacity(0.2)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Daily Workout Schedule",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          CustomButton(
                            title: 'Check',
                            onPressed: () {
                              Get.to(()=>WorkoutScheduleScreen());
                            },
                            width: 80.w,
                            padding: 5.h,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upcoming Workouts",
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
                    SizedBox(height: 10.h,),
                    GetBuilder<WorkoutScheduleController>(builder: (_){
                      final upcomingWorkouts = scheduleCtr.getUpcomingWorkouts();
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => UpComingWorkoutCard(schedule: upcomingWorkouts[index],),
                          separatorBuilder: (_, __)=>SizedBox(height: 10.h,),
                          itemCount: upcomingWorkouts.length);
                    }),
                    SizedBox(height: 10.h,),
                    Text("What do you want to train?", style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 10.h,),
                    ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index)=>WorkoutCardWidget(workout: controller.workouts[index]),
                          separatorBuilder: (_, __)=>SizedBox(height: 10.h,),
                          itemCount: controller.workouts.length
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
