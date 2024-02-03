import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/common_widgets/custom_text_field.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/complete_profile_controller.dart';
import 'package:fitness_app/routes.dart';
import 'package:fitness_app/screens/complete_profile/measure_card.dart';
import 'package:fitness_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});

  final controller = Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/img/complete_profile.png",
                height: size.height * 0.42,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  children: [
                    Text(
                      "Let's complete your profile",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "It will help us to know more about you!",
                      style: TextStyle(fontSize: 12, color: AppColors.gray),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    GetBuilder<CompleteProfileController>(
                      builder: (_)=> DropdownButtonFormField(
                          style: TextStyle(
                              fontSize: 12,
                              color: controller.selectedGender == -1 ? const Color(0xFFADA4A5) : AppColors.black,
                              fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"
                          ),
                          hint: const Text("Your Gender", style: TextStyle(color: Color(0xFFADA4A5)),),
                          iconSize: 18,
                          iconEnabledColor: const Color(0xFFADA4A5),
                          decoration: AppTheme.inputDecoration(
                              "Your Gender", Icons.people_alt,
                              suffixIcon: null),
                          items: controller.dropDownItems,
                          onChanged: (val) {
                            controller.changeGender(val);
                          },
                          value: 0),
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    CustomTextField(
                        onTap: () {
                          controller.pickDate(context);
                        },
                        controller: controller.dateController,
                        inputType: TextInputType.datetime,
                        hint: "Date of Birth",
                        prefixIcon: Icons.calendar_month_rounded),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    SizedBox(
                      width: size.width,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CustomTextField(
                                inputType: TextInputType.number,
                                hint: "Your Weight",
                                prefixIcon: Icons.monitor_weight_outlined),
                          ),
                          MeasureCard(measure: "KG")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                              inputType: TextInputType.number,
                              hint: "Your Height",
                              prefixIcon: Icons.height_rounded),
                        ),
                        MeasureCard(measure: "CM")
                      ],
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.03),
                        child: CustomButton(title: "Next", onPressed: () {
                          Get.toNamed(AppRoutes.yourGoal);
                        }))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
