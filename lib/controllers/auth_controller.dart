import 'dart:math';

import 'package:fitness_app/models/user_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  UserModel userModel = UserModel(firstName: "Zaki", lastName: "Mouzaoui", height: 174, weight: 63, dob: DateTime(2000, 10, 29));
  late double bmi;

  static AuthController get instance => Get.find();

  @override
  void onInit() {
    bmi = userModel.weight / pow(userModel.height/100, 2);
    super.onInit();
  }

  String getBmiNotes(){
    if(bmi < 18.5){
      return "You are underweight";
    }
    if(bmi >= 18.5 && bmi < 24){
      return "You have a normal weight";
    }
    return "You are overweight";
  }
}