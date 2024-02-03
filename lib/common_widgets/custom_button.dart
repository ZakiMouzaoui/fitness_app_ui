import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed, this.prefix, this.gradient, this.width=double.infinity, this.padding, this.fontSize});

  final String title;
  final VoidCallback onPressed;
  final Widget? prefix;
  final List<Color>? gradient;
  final double? width;
  final double? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Ink(decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: gradient ?? AppColors.primaryG
        ),
        borderRadius: BorderRadius.circular(40)
      ),child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: padding ?? 18.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: gradient ?? AppColors.primaryG
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefix ?? const SizedBox.shrink(),
              Text(title, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                fontSize: fontSize
              ),),
            ],
          )
        ),
      ),)
    );
  }
}
