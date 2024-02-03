import 'package:fitness_app/utils/theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.obscureText=false, required this.prefixIcon, this.suffixIcon, this.width=double.infinity, this.inputType=TextInputType.text, this.onTap, this.controller});

  final String hint;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final double? width;
  final TextInputType? inputType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        focusNode: onTap != null ? AlwaysDisabledFocusNode() : null,
        onTap: onTap,
        decoration: AppTheme.inputDecoration(hint, prefixIcon, suffixIcon: suffixIcon),
        keyboardType: inputType,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        cursorColor: AppColors.primaryColor1,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}