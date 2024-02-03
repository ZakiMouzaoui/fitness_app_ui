import 'package:fitness_app/controllers/workout_controller.dart';
import 'package:fitness_app/helpers/show_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../helpers/utils_functions.dart';
import '../models/workout_schedule.dart';

class WorkoutScheduleController extends GetxController{
  static WorkoutScheduleController get instance => Get.find();
  final controller = WorkoutController.instance;

  late final List<WorkoutSchedule> schedules = [
    WorkoutSchedule(workout: controller.workouts[1], date: DateTime(2024, 01, 15, 10, 30), shouldNotify: true),
    WorkoutSchedule(workout: controller.workouts[2], date: DateTime(2024, 02, 01, 11, 30), shouldNotify: true),
    WorkoutSchedule(workout: controller.workouts[1], date: DateTime(2024, 02, 02, 10, 30), shouldNotify: true),
    WorkoutSchedule(workout: controller.workouts[2], date: DateTime(2024, 02, 03, 10, 30), shouldNotify: true),
    WorkoutSchedule(workout: controller.workouts[0], date: DateTime(2024, 02, 04, 10, 30), shouldNotify: true),
  ];
  DateTime? scheduleDate;
  TextEditingController workoutFieldCtr = TextEditingController();
  TextEditingController dateFieldCtr = TextEditingController();
  int selectedWorkoutIdx = -1;
  DateTime pickedScheduleDate = DateTime.now();

  void addScheduleWorkout(){
    if(scheduleDate != null && selectedWorkoutIdx != -1){
      schedules.add(WorkoutSchedule(workout: controller.workouts[selectedWorkoutIdx], date: scheduleDate!, shouldNotify: true));
      update();
      Get.back();
    }
    else{
      if(selectedWorkoutIdx == -1){
        showToast("Please select a workout");
      }
      else{
        showToast("Schedule date is required");
      }
    }
  }

  void selectWorkout(int index){
    workoutFieldCtr.text = controller.workouts[index].name;
    selectedWorkoutIdx = index;
  }

  void selectDateTime(BuildContext context)async{
    showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2400)).then((pickedDate){
      if(pickedDate != null){
        scheduleDate = pickedDate;
        dateFieldCtr.text = DateFormat('dd MM yyyy').format(pickedDate).split(' ').join('-');
      }
    });
  }

  void selectScheduleTime(DateTime time){
    if(scheduleDate != null){
      scheduleDate = scheduleDate!.copyWith(hour: time.hour, minute: time.minute);
    }
    else{
      scheduleDate = DateTime.now();
      dateFieldCtr.text = DateFormat('dd MM yyyy').format(DateTime.now()).split(' ').join('-');
    }
  }

  List<WorkoutSchedule> getSchedulesByDate() => schedules.where((schedule) => isSameDate(schedule.date, pickedScheduleDate)).toList();

  void pickScheduleDate(DateTime date){
    pickedScheduleDate = date;
    update();
  }

  List<WorkoutSchedule> getUpcomingWorkouts() {
    DateTime now = DateTime.now();
    DateTime twoDaysFromNow = now.add(const Duration(days: 2));

    return schedules.where((schedule) {
      return schedule.date.isAfter(now) && schedule.date.isBefore(twoDaysFromNow);
    }).toList();
  }


  @override
  void dispose() {
    workoutFieldCtr.dispose();
    super.dispose();
  }
}
