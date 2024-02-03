import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key, this.isActive=false});

  final bool isActive;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool isActive = widget.isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          value: isActive,
          onChanged: (val) {
            setState(() {
              isActive = !isActive;
            });
          },
          activeColor: AppColors.secondaryColor1,
          thumbColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white),
          inactiveTrackColor: AppColors.gray.withOpacity(0.2),
          trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }
}