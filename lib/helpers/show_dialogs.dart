import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/food_controller.dart';
import 'package:fitness_app/controllers/meal_scheduler_controller.dart';
import 'package:fitness_app/controllers/progress_controller.dart';
import 'package:fitness_app/controllers/workout_controller.dart';
import 'package:fitness_app/controllers/workout_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showWorkoutsDialog(BuildContext context){
  final controller = WorkoutScheduleController.instance;
  final workoutCtr = WorkoutController.instance;

  showAdaptiveDialog(context: context, builder: (context)=>AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero
    ),
    backgroundColor: Colors.white,
    content: Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Choose a workout", style: TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 15.h,),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: workoutCtr.workouts.asMap().entries.map((e) => Row(
            children: [
              SizedBox(
                width: 15.w,
                child: GetBuilder<WorkoutScheduleController>(
                  builder: (_)=>Radio(value: e.key, groupValue: controller.selectedWorkoutIdx, onChanged: (val){
                    controller.selectWorkout(val!);
                    Navigator.pop(context);
                  }),
                ),
              ),
              SizedBox(width: 10.w,),
              Text(e.value.name, style: TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),)
            ],
          )).toList(),
        )
      ],
    ),
  ));
}

void showToast(String content){
  Fluttertoast.showToast(msg: content, backgroundColor: Colors.black87);
}

void showImagePickerDialog(BuildContext context){
  final controller = ProgressController.instance;

  showDialog(context: context, builder: (context)=>AlertDialog(
    backgroundColor: Colors.white,
    contentPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0)
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: (){
              controller.pickImageFromGallery();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  const Icon(Icons.image_outlined, size: 25,),
                  SizedBox(width: 10.w,),
                  Text("Open gallery", style: TextStyle(
                      color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              controller.pickImageFromCamera();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  const Icon(Icons.camera, size: 25,),
                  SizedBox(width: 10.w,),
                  Text("Open camera", style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void showMealsDialog(BuildContext context){
  final foodCtr = FoodController.instance;
  final mealSchCtr = MealSchedulerController.instance;

  showAdaptiveDialog(context: context, builder: (_)=>AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
    ),
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Choose a meal", style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 15.h,),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: foodCtr.meals.asMap().entries.map((e) => Row(
            children: [
              SizedBox(
                width: 15.w,
                child: GetBuilder<MealSchedulerController>(
                  builder: (_)=>Radio(value: e.value.name, groupValue: mealSchCtr.selectedMeal?.name, onChanged: (val){
                    mealSchCtr.selectMeal(e.value);
                    Navigator.pop(context);
                  }),
                ),
              ),
              SizedBox(width: 10.w,),
              Text(e.value.name, style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),)
            ],
          )).toList(),
        )
      ],
    ),
  ));
}

void showFoodsDialog(BuildContext context){
  final foodCtr = FoodController.instance;
  final mealSchCtr = MealSchedulerController.instance;

  showAdaptiveDialog(context: context, builder: (context)=>AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
    ),
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Select foods", style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 15.h,),
        GetBuilder<MealSchedulerController>(
          builder: (_) {
            return FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: mealSchCtr.selectedMeal!.foods.asMap().entries.map((e) => GestureDetector(
                  onTap: (){mealSchCtr.addFood(e.value);},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                        child: GetBuilder<MealSchedulerController>(
                          builder: (_)=>Checkbox(value: mealSchCtr.selectedFoods.contains(e.value), onChanged: (val){
                            mealSchCtr.addFood(e.value);
                          })
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text(e.value.name, style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ), maxLines: 2,)
                    ],
                  ),
                )).toList(),
              ),
            );
          }
        )
      ],
    ),
  ));
}