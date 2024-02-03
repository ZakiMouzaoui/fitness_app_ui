import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key, required this.info, required this.value});

  final String info;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.gray.withOpacity(0.1),width: 1.5),
        borderRadius:  BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor1
          ),),
          SizedBox(height: 5.h,),
          Text(info, style: TextStyle(
            color: AppColors.gray,
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),)
        ],
      ),
    );
  }
}
