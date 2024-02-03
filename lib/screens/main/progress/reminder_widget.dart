import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.withOpacity(0.15)
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 60.h,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  child: Image.asset("assets/img/date_notification.png"),
                ),
                SizedBox(width: 8.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Reminder", style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),),
                    Text("Next Photos Fall On July 08", style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                )
              ],
            ),
            Positioned(right: 0, child: Icon(Icons.close, color: AppColors.gray, size: 20,))
          ],
        )
    );
  }
}
