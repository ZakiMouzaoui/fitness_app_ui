import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.hasReturnBtn=true});

  final String title;
  final bool hasReturnBtn;

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hasReturnBtn ? GestureDetector(
            onTap: ()=> Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black, size: 16,),
            ),
          ) :  const SizedBox.shrink(),
          Text(title, style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.more_horiz_rounded, color: AppColors.black, size: 16,),
          ),
        ],
      );
  }
}
