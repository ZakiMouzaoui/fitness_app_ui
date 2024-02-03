import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../models/meal_model.dart';

class FoodSteps extends StatelessWidget {
  const FoodSteps({super.key, required this.steps});

  final List<FoodPreparation> steps;

  @override
  Widget build(BuildContext context) {
    return Stepper(
        margin: EdgeInsets.only(top: 0, left: 55.w),
        physics: const ClampingScrollPhysics(),
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return const SizedBox.shrink();
        },
        connectorColor: MaterialStateProperty.all(AppColors.secondaryColor1),
        steps: steps
            .map((step) => Step(
                isActive: true,
                title: Text(
                  step.title,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      step.content,
                      style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ))))
            .toList());
  }
}
