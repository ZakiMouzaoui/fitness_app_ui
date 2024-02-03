import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/common_widgets/switch_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/helpers/utils_functions.dart';
import 'package:fitness_app/screens/main/profile/profile_info_card.dart';
import 'package:fitness_app/screens/main/profile/setting_card.dart';
import 'package:fitness_app/screens/main/profile/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          const CustomAppBar(title: "Profile", hasReturnBtn: false,),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor1.withOpacity(0.2),
                      radius: 30,
                      backgroundImage: const AssetImage("assets/img/u1.png"),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AuthController.instance.userModel.firstName} ${AuthController.instance.userModel.lastName}",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Gain weight program",
                          style: TextStyle(
                              color: AppColors.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      title: "Edit",
                      onPressed: () {},
                      width: 90.w,
                      padding: 7.h,
                      fontSize: 12,
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileInfoCard(
                        info: "Height",
                        value: '${AuthController.instance.userModel.height} cm'),
                    ProfileInfoCard(
                        info: "Weight",
                        value: '${AuthController.instance.userModel.weight} kg'),
                    ProfileInfoCard(
                        info: "Age",
                        value:
                        '${calculateAge(AuthController.instance.userModel.dob)} yo')
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SettingCard(
                  title: "Account",
                  settings: [
                    SettingTile(
                        leadingIcon: Icons.person_outline_rounded,
                        title: "Personal Data",
                        trailingIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: AppColors.gray,
                        )),
                    const SettingTile(
                      leadingIcon: Icons.notes_rounded,
                      title: "Achievement",
                    ),
                    const SettingTile(
                      leadingIcon: Icons.history_rounded,
                      title: "Activity History",
                    ),
                    const SettingTile(
                      leadingIcon: Icons.add_chart,
                      title: "Workout Progress",
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SettingCard(
                  title: "Notification",
                  height: 8.h,
                  settings: const [
                    SettingTile(
                        leadingIcon: Icons.notifications_outlined,
                        title: "Pop-up Notification",
                        margin: 0,
                        trailingIcon: SwitchButton()),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const SettingCard(title: "Other", settings: [
                  SettingTile(
                      leadingIcon: Icons.message_outlined, title: "Contact Us"),
                  SettingTile(
                      leadingIcon: Icons.shield_moon_outlined, title: "Privacy Policy"),
                  SettingTile(
                      leadingIcon: Icons.settings, title: "Settings")
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
