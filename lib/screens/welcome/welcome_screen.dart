import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h,),
          Expanded(child: Image.asset('assets/img/welcome.png')),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Welcome, Zaki", style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("You are all set now, let's reach your goals together with us", style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 12
                    ), textAlign: TextAlign.center,)
                  ],
                ),
                CustomButton(title: "Go To Home", onPressed: () {
                  Get.toNamed(AppRoutes.main);
                })
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
