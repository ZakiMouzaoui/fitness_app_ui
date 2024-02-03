import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key, required this.model});

  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: size.height/2, width: size.width, child: Image.asset(model.img, fit: BoxFit.cover)),
              SizedBox(height: 50.h,),
              Expanded(flex: 6, child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width/1.5,
                      child: Text(model.title, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.black
                      ),),
                    ),
                    SizedBox(height: 10.h,),
                    Text(model.subtitle, style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.gray,
                    ),),
                    SizedBox(height: 80.h,),

                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
