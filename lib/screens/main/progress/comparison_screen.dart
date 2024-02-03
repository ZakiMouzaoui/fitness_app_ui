import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/common_widgets/custom_text_field.dart';
import 'package:fitness_app/controllers/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ComparisonScreen extends StatelessWidget {
  ComparisonScreen({super.key});

  final controller = Get.put(ProgressController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            const CustomAppBar(title: "Comparison"),
            SizedBox(height: 30.h,),
            CustomTextField(hint: "From Date 1", controller: controller.date1Ctr, prefixIcon: Icons.date_range_rounded, suffixIcon: Icons.arrow_forward_ios, onTap: (){
              controller.pickDate1(context);
            }),
            SizedBox(height: 15.h,),
            CustomTextField(hint: "To Date 2", controller: controller.date2Ctr, prefixIcon: Icons.date_range_rounded, suffixIcon: Icons.arrow_forward_ios, onTap: (){
              controller.pickDate2(context);
            },),
            const Spacer(),
            CustomButton(title: "Compare", padding: 15.h, onPressed: (){
              controller.compareResults(context);
            })
          ],
        )
      ),
    ));
  }
}
