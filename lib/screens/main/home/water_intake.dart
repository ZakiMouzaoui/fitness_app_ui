import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';


class WaterIntakeWidget extends StatelessWidget {
  WaterIntakeWidget({super.key});

  final List waterArr = [
    {
      "time": "6am-8am",
      "intake": 600
    },
    {
      "time": "9am-11am",
      "intake": 400
    },
    {
      "time": "11am-2pm",
      "intake": 300
    },
    {
      "time": "2pm-4pm",
      "intake": 400
    },
    {
      "time": "4pm-now",
      "intake": 300
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lightGray, width: 3)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleAnimationProgressBar(
            height: 310.h,
            width: 30,
            backgroundColor: AppColors.lightGray,
            foregrondColor: AppColors.primaryColor1,
            ratio: 0.7,
            direction: Axis.vertical,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 3),
            borderRadius: BorderRadius.circular(20),
            gradientColor: LinearGradient(
                  colors: AppColors.primaryG
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Water Intake", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.black
              ),),
              SizedBox(height: 5.h,),
              Text("2 Liters", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor1
              ),),
              SizedBox(height: 10.h,),
              Text("Real time updates", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: AppColors.gray
              ),),
              SizedBox(height: 10.h,),
              Column(
                children: List.generate(5, (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        children: [
                          SizedBox(height: 2.h,),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: AppColors.secondaryG
                              )
                            ),
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(height: 5.h,),
                          index < 4 ? DottedDashedLine(height: 30.h, width: 0, axis: Axis.vertical, dashColor: AppColors.secondaryColor1,) : const SizedBox.shrink()
                        ],
                      ),
                      SizedBox(width: 3.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(waterArr[index]["time"], style: TextStyle(
                            fontSize: 10,
                            color: AppColors.gray
                          ),),
                          SizedBox(height: 3.h,),
                          Text("${waterArr[index]["intake"]}ml", style: TextStyle(
                            color: AppColors.secondaryColor1,
                            fontSize: 12
                          ),)
                        ],
                      )
                    ],
                )).toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
