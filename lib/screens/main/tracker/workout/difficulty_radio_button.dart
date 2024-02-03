import 'package:fitness_app/controllers/workout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';

class DifficultyRadioButton extends StatelessWidget {
  const DifficultyRadioButton({super.key, required this.title, required this.value});

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutController>(
      builder: (controller) =>Row(
        children: [
          Radio(
              value: value,
              groupValue: controller.selectedDifficultyIdx,
              onChanged: (int? value) {
                controller.selectDifficulty(value!);
                Navigator.pop(context);
              },
              activeColor: AppColors.primaryColor1),
          Text(
            title,
            style: TextStyle(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
