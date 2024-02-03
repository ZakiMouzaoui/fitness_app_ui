import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static InputDecoration inputDecoration(String hint, IconData prefixIcon, {required IconData? suffixIcon}){
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
      focusedBorder: OutlineInputBorder(),
      hintText: hint,
      prefixIcon: Padding(padding: const EdgeInsets.only(top: 1), child: Icon(prefixIcon, color: const Color(0xFFADA4A5), size: 18)),
      suffixIcon: Icon(suffixIcon, color: const Color(0xFFADA4A5), size: 18),
      hintStyle: const TextStyle(
          color: Color(0xFFADA4A5),
          fontSize: 12
      ),
      filled: true,
      fillColor: AppColors.lightGray

    );
  }
}