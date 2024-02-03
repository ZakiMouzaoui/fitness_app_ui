import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Fitness", style: TextStyle(
                  fontSize: 36,
                    fontWeight: FontWeight.w700
                ),),
                Text("X", style: TextStyle(
                  color: AppColors.primaryColor1,
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            Text("Every body can train",style: TextStyle(
              color: AppColors.gray,
              fontSize: 18,
              fontWeight: FontWeight.w400
            ),),
            const Spacer(),
            CustomButton(title: 'Get Started', onPressed: (){
              Get.offNamed(AppRoutes.onBoarding);
            })
          ],
        ),
      ),
    );
  }
}
