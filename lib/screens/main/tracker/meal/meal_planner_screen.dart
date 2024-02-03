import 'package:fitness_app/controllers/food_controller.dart';
import 'package:fitness_app/controllers/meal_scheduler_controller.dart';
import 'package:fitness_app/screens/main/tracker/meal/meal_card_widget.dart';
import 'package:fitness_app/screens/main/tracker/meal/schedule/food_schedule_card.dart';
import 'package:fitness_app/screens/main/tracker/meal/schedule/meal_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../constants/colors.dart';
import '../../home/progress_chart_widget.dart';

class MealPlannerScreen extends StatelessWidget {
  MealPlannerScreen({super.key});

  final controller = Get.put(FoodController());
  final mealSchCtr = Get.put(MealSchedulerController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.primaryG)),
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
                      "Meal Planner",
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
                          "Daily Meal Schedule",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        CustomButton(
                          title: 'Check',
                          onPressed: () {
                            Get.to(()=>MealScheduleScreen());
                          },
                          width: 80.w,
                          padding: 5.h,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meals",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Container(
                          height: 25.h,
                          padding: EdgeInsets.only(left: 10.w, right: 5.w),
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: AppColors.primaryG),
                              borderRadius: BorderRadius.circular(15)),
                          child: DropdownButtonHideUnderline(
                            child: GetBuilder<MealSchedulerController>(
                              builder: (_) => DropdownButton(
                                  selectedItemBuilder: (_) => [
                                        DropdownMenuItem(
                                            child: Text(
                                          mealSchCtr.mealsMenuItems[mealSchCtr.selectedMealItem],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ))
                                      ],
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontFamily: "Poppins"),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  value: 0,
                                  items: List.generate(
                                      4,
                                      (index) => DropdownMenuItem(
                                            value: index,
                                            child: Text(
                                              mealSchCtr.mealsMenuItems[index],
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                  onChanged: (val) {
                                    mealSchCtr.selectMealItem(val!);
                                  }),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  GetBuilder<MealSchedulerController>(builder: (_){
                        final foods = mealSchCtr.getTodayFoodsByMeal();
                        if(foods.isEmpty){
                          return SizedBox(
                            height: 50.h,
                            child: Center(
                              child: Text("We couldn't find any schedule for this meal", style: TextStyle(
                                color: AppColors.black
                              ), textAlign: TextAlign.center,),
                            ),
                          );
                        }
                        return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (_, index)=>FoodScheduleCard(food: foods[index]),
                            itemCount: foods.length,
                            separatorBuilder: (_, __)=>SizedBox(height: 10.h,),
                        );
                      }
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Find Something to Eat",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                      height: 150.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => MealCardWidget(
                            index: index, meal: controller.meals[index]),
                        itemCount: controller.meals.length,
                        separatorBuilder: (_, __)=>SizedBox(width: 15.w,),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
