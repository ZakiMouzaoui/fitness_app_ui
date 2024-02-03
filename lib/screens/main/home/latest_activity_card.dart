import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/colors.dart';


class LatestActivityCard extends StatelessWidget {
  const LatestActivityCard({super.key, required this.bgColor, required this.img, required this.title, required this.time});

  final Color bgColor;
  final String img;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.15), width: 1.5)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: bgColor.withOpacity(0.3),
                  backgroundImage: AssetImage(img),
                  radius: 30,
                ),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),),
                    SizedBox(height: 3.h,),
                    Text(time, style: TextStyle(
                        color: AppColors.gray,
                        fontSize: 10,
                        fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 5.h,),
                  ],
                )
              ],
            )),
            SizedBox(width: 10.w,),
            Icon(Icons.more_vert_rounded, color: AppColors.gray,)
          ],
        ),
    );
  }
}
