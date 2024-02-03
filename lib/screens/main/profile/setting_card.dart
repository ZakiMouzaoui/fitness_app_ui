import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/main/profile/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key, required this.title, required this.settings, this.height});

  final String title;
  final List<SettingTile> settings;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: height ?? 15.h,),
          Column(
            children: settings,
          )
        ],
      ),
    );
  }
}
