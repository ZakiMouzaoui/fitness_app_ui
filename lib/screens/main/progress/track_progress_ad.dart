import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackProgressAd extends StatelessWidget {
  const TrackProgressAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor1.withOpacity(0.2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160.w,
                child: RichText(
                    text: TextSpan(
                        text: "Track Your Progress Each Month With",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontFamily: "Poppins"
                        ),
                        children: [TextSpan(text: " Photo", style: TextStyle(
                          color: AppColors.primaryColor1,
                          fontSize: 15,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600
                        ))])),
              ),
              SizedBox(height: 15.h,),
              CustomButton(width: 100.w, padding: 8.h, fontSize: 11, title: "Learn More", onPressed: (){})
            ],
          ),
          const Spacer(),
          Image.asset("assets/img/progress_each_photo.png", width: 100.w,)
        ],
      ),
    );
  }
}
