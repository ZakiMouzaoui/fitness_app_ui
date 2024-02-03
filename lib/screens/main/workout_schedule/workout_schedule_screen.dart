import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/common_widgets/custom_text_field.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/workout_schedule_controller.dart';
import 'package:fitness_app/helpers/show_dialogs.dart';
import 'package:fitness_app/screens/main/workout_schedule/workout_schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class WorkoutScheduleScreen extends StatelessWidget {
  WorkoutScheduleScreen({super.key});

  final controller = WorkoutScheduleController.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            const CustomAppBar(title: "Workout Schedule"),
            SizedBox(
              height: 30.h,
            ),
            CalendarAgenda(
              initialDate: DateTime.now(),
              firstDate: DateTime(2006),
              lastDate: DateTime(2040),
              onDateSelected: (date) {
                controller.pickScheduleDate(date);
              },
              backgroundColor: Colors.white,
              dateColor: AppColors.black,
              dayBGColor: Colors.grey.withOpacity(0.2),
              events: controller.schedules.map((e) => e.date).toList(),
              selectedDayPosition: SelectedDayPosition.center,
              fullCalendar: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GetBuilder<WorkoutScheduleController>(
                builder: (_) {
                  final schedules = controller.getSchedulesByDate();
                  if (schedules.isEmpty) {
                    return Text("No Schedules Found", style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500
                    ));
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        WorkoutScheduleCard(
                            workoutSchedule: schedules[index]),
                    itemCount: schedules.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.h,),
                  );
                })
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => showAddWorkoutScheduleDialog(context),
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

void showAddWorkoutScheduleDialog(BuildContext context) {
  final controller = WorkoutScheduleController.instance;

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
                    SizedBox(height: 10.h),
                    CustomTextField(
                      hint: "Thu, 31 Jan 2024",
                      prefixIcon: Icons.date_range_rounded,
                      onTap: () {
                        controller.selectDateTime(context);
                      },
                      controller: controller.dateFieldCtr,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Time",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TimePickerSpinner(
                      locale: const Locale('en', ''),
                      time: DateTime.now(),
                      is24HourMode: false,
                      itemHeight: 50.h,
                      normalTextStyle:
                          TextStyle(fontSize: 14, color: AppColors.gray),
                      highlightedTextStyle: TextStyle(
                          fontSize: 16, color: AppColors.primaryColor1),
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        controller.selectScheduleTime(time);
                      },
                      spacing: 80.w,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Workout Details",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      hint: "Choose Workout",
                      prefixIcon: Icons.directions_run,
                      onTap: () {
                        showWorkoutsDialog(context);
                      },
                      suffixIcon: Icons.arrow_forward_ios_rounded,
                      controller: controller.workoutFieldCtr,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                        title: "Save",
                        padding: 15.h,
                        onPressed: () {
                          controller.addScheduleWorkout();
                        })
                  ],
                ),
              ),
            ],
          ));
}
