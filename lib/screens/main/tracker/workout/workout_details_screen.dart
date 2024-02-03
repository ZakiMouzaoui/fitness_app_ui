import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/controllers/workout_controller.dart';
import 'package:fitness_app/models/exercise_model.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/screens/main/tracker/workout/difficulty_radio_button.dart';
import 'package:fitness_app/screens/main/tracker/workout/exercise_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  WorkoutDetailsScreen({super.key, required this.workout});

  final Workout workout;

  final controller = Get.put(WorkoutController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) {
        controller.onClose();
      },
      child: SafeArea(
          child: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: AppColors.primaryG)),
          child: NestedScrollView(
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
                expandedHeight: 180.h,
                collapsedHeight: 80.h,
                flexibleSpace: CachedNetworkImage(imageUrl: workout.cover ?? workout.img,),
              ),
            ],
            body: Container(
                height: MediaQuery.of(context).size.height,
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
                      Text(
                        workout.name,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${workout.numExercises} Exercises | ${workout.duration} mins | ${workout.caloriesBurned.toInt()} calories burned',
                        style: TextStyle(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor1.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: AppColors.gray,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Schedule Workout",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.gray,
                              size: 17,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () => showDifficultyDialog(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor1.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.height_rounded,
                                color: AppColors.gray,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Difficulty",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.gray),
                              ),
                              const Spacer(),
                              GetBuilder<WorkoutController>(
                                builder: (_)=>Text(controller.selectedDifficultyIdx != 0 ? controller.difficulties[controller.selectedDifficultyIdx] :"", style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.gray,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                        ],
                      ),
                      GetBuilder<WorkoutController>(
                        builder: (_) => Column(
                            children: controller.selectedDifficultyIdx != 0
                                ? workout.exercises
                                    .where((e) =>
                                        e.difficulty ==
                                        controller
                                            .difficulties[
                                                controller.selectedDifficultyIdx]
                                            .difficulty)
                                    .map((e) => ExerciseCardWidget(exercise: e))
                                    .toList()
                                : workout.exercises
                                    .map((e) => ExerciseCardWidget(exercise: e))
                                    .toList()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showDifficultyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DifficultyRadioButton(
            title: "All",
            value: 0,
          ),
          DifficultyRadioButton(
            title: "Beginner",
            value: 1,
          ),
          DifficultyRadioButton(
            title: "Intermediate",
            value: 2,
          ),
          DifficultyRadioButton(
            title: "Advanced",
            value: 3,
          ),
        ],
      ),
    ),
  );
}
