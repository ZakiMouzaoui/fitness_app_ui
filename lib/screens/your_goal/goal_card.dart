import 'package:fitness_app/models/goal_model.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class GoalCard extends StatelessWidget {
  const GoalCard({super.key, required this.goalModel});

  final GoalModel goalModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.072*w, vertical: 0.072*w),
            decoration: BoxDecoration(
          //color: AppColors.primaryColor2,
          borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: AppColors.primaryG
              )
      ),
      child: Column(
        children: [
          Expanded(flex: 2, child: Image.asset(goalModel.img)),
          const SizedBox(height: 10,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(goalModel.goal, style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),),
              Container(
                color: Colors.white,
                height: 2,
                width: w/6,
              ),
              SizedBox(height: 0.021*h,),
              Text(goalModel.description, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12
              ), textAlign: TextAlign.center,)
            ],
          ))
        ],
      ),
    );
  }
}
