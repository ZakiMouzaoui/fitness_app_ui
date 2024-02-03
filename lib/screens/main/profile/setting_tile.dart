import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({super.key, required this.leadingIcon, required this.title, this.trailingIcon, this.margin});

  final IconData leadingIcon;
  final String title;
  final Widget? trailingIcon;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin ?? 8.h),
      child: Row(
        children: [
          Icon(leadingIcon,color: AppColors.primaryColor1,),
          SizedBox(width: 5.w,),
          Text(title, style: TextStyle(
            color: AppColors.gray,
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),),
          const Spacer(),
          trailingIcon ?? Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.gray,)
        ],
      ),
    );
  }
}
