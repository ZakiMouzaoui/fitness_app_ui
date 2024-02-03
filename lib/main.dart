import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/routes.dart';
import 'package:fitness_app/screens/main/main_view.dart';
import 'package:fitness_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main()async{
  await ScreenUtil.ensureScreenSize();
  runApp(const FitnessAppUi());
}

class FitnessAppUi extends StatelessWidget {
  const FitnessAppUi({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375,812));
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      builder:(_,__)=> GetMaterialApp(
        onGenerateRoute: AppRoutes.generateRoute,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor1,
          fontFamily: "Poppins",
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(AppColors.primaryColor1),
          )
        ),
        debugShowCheckedModeBanner: false,
        home: MainView()
      ),
    );
  }
}
