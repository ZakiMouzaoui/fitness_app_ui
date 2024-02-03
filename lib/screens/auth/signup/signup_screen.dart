import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/common_widgets/custom_text_field.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  const Text(
                    "Create an Account",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
           CustomTextField(hint: "First Name", prefixIcon: Icons.person),
            SizedBox(
              height: 15,
            ),
            CustomTextField(hint: "Last Name", prefixIcon: Icons.person),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                hint: "Email", prefixIcon: Icons.email_rounded),
            SizedBox(
              height: 15,
            ),
            CustomTextField(hint: "Password", prefixIcon: Icons.lock, suffixIcon: Icons.remove_red_eye_rounded,),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    height: 25,
                    child: Checkbox(
                        value: false,
                        onChanged: (val) {},
                        checkColor: AppColors.gray,
                        focusColor: AppColors.gray,
                      side: BorderSide(color: AppColors.gray),
                    ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                    width: size.width/1.5,
                    child: Text(
                      "By continuing you accept our Privacy Policy and Term of Use",
                      style: TextStyle(color: AppColors.gray, fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 120,),
            CustomButton(title: "Register", onPressed: (){}),
            const SizedBox(height: 30,),
            Row(children: [
              Expanded(child: Container(height: 2, color: AppColors.lightGray,)),
              const SizedBox(width: 10,),
              const Text("Or"),
              const SizedBox(width: 10,),
              Expanded(child: Container(height: 2, color: AppColors.lightGray,)),
            ],),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xffDDDADA))
                  ),
                  child: Image.asset("assets/img/google.png", fit: BoxFit.contain,),
                ),
                SizedBox(width: 30,),
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffDDDADA))
                  ),
                  child: Image.asset("assets/img/facebook.png", fit: BoxFit.contain, width: 15, height: 15,),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black
                ),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.login);
                  },
                  child: Text("Login", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor1
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
