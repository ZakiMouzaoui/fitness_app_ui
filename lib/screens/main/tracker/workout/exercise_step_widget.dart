import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseStepWidget extends StatelessWidget {
  const ExerciseStepWidget({super.key, required this.step, required this.index});

  final ExerciseStep step;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 25.w,
                child: Text("0$index", style: TextStyle(
                    color: AppColors.secondaryColor1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.secondaryColor1)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppColors.secondaryG,
                          ),
                          shape: BoxShape.circle
                      ),
                      width: 10.w,
                      height: 10.h,
                    ),
                  ),
                  //DottedDashedLine(height: 50.h, width: 2.w, axis: Axis.vertical, dashColor: AppColors.secondaryColor1,)
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 15.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(step.title, style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),),
              Text(step.description, style: TextStyle(
                color: AppColors.gray,
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
        )
      ],
    );
  }
}
