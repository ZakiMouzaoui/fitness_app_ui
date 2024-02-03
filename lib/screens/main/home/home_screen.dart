import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/routes.dart';
import 'package:fitness_app/screens/main/home/activity_status.dart';
import 'package:fitness_app/screens/main/home/calories_intake.dart';
import 'package:fitness_app/screens/main/home/latest_workout.dart';
import 'package:fitness_app/screens/main/home/sleep_amount.dart';
import 'package:fitness_app/screens/main/home/water_intake.dart';
import 'package:fitness_app/screens/main/home/workout_progress.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray)),
                  Text(
                    "${AuthController.instance.userModel.firstName.capitalizeFirst} ${AuthController.instance.userModel.lastName.capitalizeFirst}",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.notifications);
                },
                child: Container(
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: AppColors.gray,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 146.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(colors: AppColors.primaryG)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset('assets/img/bg_dots.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "BMI (Body Mass Index)",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            AuthController.instance.getBmiNotes(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomButton(
                            title: "View More",
                            onPressed: () {},
                            gradient: AppColors.secondaryG,
                            width: 120.w,
                            padding: 8.h,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 90.w,
                        child: PieChart(PieChartData(
                            startDegreeOffset: 0,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: [
                              PieChartSectionData(
                                  value: 80,
                                  showTitle: false,
                                  color: Colors.white),
                              PieChartSectionData(
                                  value: 30,
                                  radius: 48,
                                  color: AppColors.secondaryColor1,
                                  title: AuthController.instance.bmi
                                      .toStringAsFixed(1),
                                  titleStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  gradient: LinearGradient(
                                      colors: AppColors.secondaryG)),
                            ])),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryColor1.withOpacity(0.2)),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today Target",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                CustomButton(
                  title: 'Check',
                  onPressed: () {
                    Get.toNamed(AppRoutes.activityTracker);
                  },
                  width: 80.w,
                  padding: 5.h,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Activity Status",
            style:
                TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          const ActivityStatus(),
          SizedBox(height: 15.h,),
          SizedBox(
            height: 360.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WaterIntakeWidget(),
                Column(
                  children: [
                    const Expanded(child: SleepAmount()),
                    SizedBox(height: 10.h,),
                    const Expanded(child: CaloriesIntake())
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          const WorkoutProgress(),
          SizedBox(height: 20.h,),
          RecentWorkouts()
        ],
      ),
    );
  }
}
