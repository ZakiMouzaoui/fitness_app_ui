import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CompleteProfileController extends GetxController {
  static CompleteProfileController get instance => Get.find();

  final items = ["Your Gender", "Male", "Female"];

  late List<DropdownMenuItem> dropDownItems;
  int selectedGender = -1;

  TextEditingController dateController = TextEditingController();

  @override
  void onInit() {
    dropDownItems = List.generate(
        3, (index) => DropdownMenuItem(value: index-1,child: Text(items[index]),));
    super.onInit();
  }

  void changeGender(int value) {
    selectedGender = value;
    update();
  }

  void pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor1,
          ),
          dialogBackgroundColor: Colors.blue[500],
        ),
        child: child!,
      ),
      initialDate: DateTime(2006, 1),
      firstDate: DateTime(2000, 1),
      lastDate: DateTime.now(),
    ).then((picked) {
      if(picked != null){
        dateController.text = DateFormat("yyyy-MM-dd").format(picked).toString();
      }
    });
  }
}
