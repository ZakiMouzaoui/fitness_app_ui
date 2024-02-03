import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/controllers/meal_scheduler_controller.dart';
import 'package:fitness_app/helpers/show_dialogs.dart';
import 'package:fitness_app/screens/main/tracker/meal/schedule/food_schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widgets/custom_button.dart';
import '../../../../../common_widgets/custom_text_field.dart';
import '../../../../../constants/colors.dart';


class MealScheduleScreen extends StatelessWidget {
  MealScheduleScreen({super.key});

  final mealSchCtr = MealSchedulerController.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            const CustomAppBar(title: "Meal Schedule"),
            SizedBox(
              height: 30.h,
            ),
            CalendarAgenda(
              initialDate: DateTime.now(),
              firstDate: DateTime(2006),
              lastDate: DateTime(2040),
              onDateSelected: (date) {
                mealSchCtr.selectScheduleDate(date);
              },
              backgroundColor: Colors.white,
              dateColor: AppColors.black,
              dayBGColor: Colors.grey.withOpacity(0.2),
              events: [],
              selectedDayPosition: SelectedDayPosition.center,
              fullCalendar: true,
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: GetBuilder<MealSchedulerController>(builder: (_){
                final schedules = mealSchCtr.getMealSchedulesByDate(mealSchCtr.scheduleDate ?? DateTime.now());
                if(schedules.isNotEmpty){

                  return ListView.separated(
                      itemBuilder: (_,index){
                        final schedule = schedules[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(schedule.meal.capitalizeFirst!, style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text("${schedule.foods.length} meals | ${mealSchCtr.getMealTotalCalories(schedule.foods)} calories", style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),),

                              ],
                            ),
                            SizedBox(height: 5.h,),
                            ...schedule.foods.map((food) => Column(
                              children: [
                                FoodScheduleCard(food: food),
                                SizedBox(height: 10.h,)
                              ],
                            )).toList()
                          ],
                        );
                      },
                      separatorBuilder: (_,__)=>SizedBox(height: 10.h,),
                      itemCount: schedules.length
                  );
                }
                return Text("No schedules for this date", style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),);
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          showMealScheduleDialog(context);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: AppColors.secondaryG)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }
}

void showMealScheduleDialog(BuildContext context){
  final mealSchCtr = MealSchedulerController.instance;

  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                CustomTextField(
                  hint: DateFormat('dd MM yyyy').format(DateTime.now()).split(' ').join('-'),
                  prefixIcon: Icons.date_range_rounded,
                  onTap: () {
                    mealSchCtr.pickDate(context);
                  },
                  controller: mealSchCtr.dateFieldCtr,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Meal",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                CustomTextField(
                  hint: "Choose a meal",
                  prefixIcon: Icons.fastfood_rounded,
                  suffixIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    showMealsDialog(context);
                  },
                  controller: mealSchCtr.mealFieldCtr,
                ),
                SizedBox(height: 10.h,),
                GetBuilder<MealSchedulerController>(
                  builder: (context) {
                    return Row(
                      children: [
                        Text(
                          "Foods",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("(${mealSchCtr.selectedFoods.length} selected)", style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),)
                      ],
                    );
                  }
                ),
               CustomTextField(hint: 'Select foods', prefixIcon: Icons.no_meals, onTap: (){
                 mealSchCtr.pickFood(context);
               },),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    title: "Save",
                    padding: 15.h,
                    onPressed: () {
                      mealSchCtr.saveSchedule();
                    })
              ],
            ),
          ),
        ],
      ));
}