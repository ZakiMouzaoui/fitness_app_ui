import 'package:fitness_app/controllers/food_controller.dart';
import 'package:fitness_app/helpers/show_dialogs.dart';
import 'package:fitness_app/helpers/utils_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/meal_model.dart';

class MealSchedulerController extends GetxController{
  static MealSchedulerController get instance => Get.find();

  final foodCtr = FoodController.instance;

  DateTime? scheduleDate;
  Meal? selectedMeal;
  List<Food> selectedFoods = [];

  TextEditingController mealFieldCtr = TextEditingController();
  TextEditingController dateFieldCtr = TextEditingController();

  int selectedMealItem = 0;
  final mealsMenuItems = ["breakfast", "launch", "dinner", "snack"];

  late final List<MealSchedule> mealSchedules = [
    MealSchedule(meal: "breakfast", foods: [
      foodCtr.foods[0],
      foodCtr.foods[2]
    ], date: DateTime.now()),
    MealSchedule(meal: "launch", foods: [
      foodCtr.foods[5],
      foodCtr.foods[6]
    ], date: DateTime.now())
  ];

  void pickDate(BuildContext context){
    showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2400)).then((pickedDate){
      if(pickedDate != null){
        scheduleDate = pickedDate;
        dateFieldCtr.text = DateFormat('dd MM yyyy').format(pickedDate).split(' ').join('-');
      }
    });
  }

  void selectMeal(Meal meal){
    selectedMeal = meal;
    mealFieldCtr.text = meal.name;
    clearFoods();
    update();
  }

  void pickFood(BuildContext context){
    if(selectedMeal == null){
      showToast("Please select a meal first");
    }
    else{
      showFoodsDialog(context);
    }
  }

  void addFood(Food food){
    if(selectedFoods.contains(food)){
      selectedFoods.remove(food);
    }
    else{
      selectedFoods.add(food);
    }
    update();
  }

  void clearFoods(){
    selectedFoods.clear();
  }

  void saveSchedule(){
    if(scheduleDate == null){
      showToast("Please select a date");
      return;
    }
    if(selectedMeal == null){
      showToast("Please select a meal");
      return;
    }
    if(selectedFoods.isEmpty){
      showToast("Please select at least a food");
      return;
    }
    mealSchedules.add(MealSchedule(meal: selectedMeal!.name, foods: selectedFoods, date: scheduleDate!));
  }

  void selectMealItem(int index){
    selectedMealItem = index;
    update();
  }

  void selectScheduleDate(DateTime date){
    scheduleDate = date;
    update();
  }

  List<Food> getTodayFoodsByMeal(){
    final schedule =  mealSchedules.firstWhereOrNull((element) => isSameDate(element.date, DateTime.now()) && element.meal == mealsMenuItems[selectedMealItem]);
    if(schedule != null){
      return schedule.foods;
    }
    return [];
  }

  List<MealSchedule> getMealSchedulesByDate(DateTime date){
    return mealSchedules.where((element) => isSameDate(element.date, date)).toList();
  }

  int getMealTotalCalories(List<Food> foods){
    int totalCalories = 0;

    for (var food in foods) {
      totalCalories += food.totalCalories;
    }
    return totalCalories;
  }

  @override
  void dispose() {
    mealFieldCtr.dispose();
    super.dispose();
  }
}