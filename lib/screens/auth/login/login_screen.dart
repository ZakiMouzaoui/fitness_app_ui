import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(color: AppColors.black),
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(hint: "Email", prefixIcon: Icons.email_rounded),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: "Password",
              prefixIcon: Icons.lock,
              suffixIcon: Icons.remove_red_eye_rounded,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Forgot your password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.gray,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 250,
            ),
            CustomButton(
                title: "Login",
                prefix: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    )),
                onPressed: () {
                  Get.toNamed(AppRoutes.completeProfile);
                }),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 2,
                  color: AppColors.lightGray,
                )),
                const SizedBox(
                  width: 10,
                ),
                const Text("Or"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  height: 2,
                  color: AppColors.lightGray,
                )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffDDDADA))),
                  child: Image.asset(
                    "assets/img/google.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffDDDADA))),
                  child: Image.asset(
                    "assets/img/facebook.png",
                    fit: BoxFit.contain,
                    width: 15,
                    height: 15,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.signUp);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor1),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
