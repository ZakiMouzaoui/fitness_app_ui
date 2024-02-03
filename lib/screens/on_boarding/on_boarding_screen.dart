import 'package:fitness_app/controllers/on_boarding_controller.dart';
import 'package:fitness_app/routes.dart';
import 'package:fitness_app/screens/on_boarding/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (index){
                  controller.moveToPage(index);
                },
                controller: controller.controller,
                itemCount: 4,
                itemBuilder: (_, index) => TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, value, _) => Opacity(
                        opacity: value,
                        child:
                            OnBoardingWidget(model: controller.models[index]))),
              ),
              Positioned(
                  right: 20,
                  bottom: 40,
                  child: GestureDetector(
                    onTap: () {
                      if(controller.currentPage == 3){
                        Get.offAllNamed(AppRoutes.login);
                      }
                      else{
                        controller.controller.animateToPage(
                          controller.currentPage + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            height: 70,
                            width: 70,
                            child: GetBuilder<OnBoardingController>(
                              builder: (_) => TweenAnimationBuilder(
                                builder: (context, value, ___) =>
                                    CircularProgressIndicator(
                                  strokeWidth: 3,
                                  value: value,
                                  color: AppColors.primaryColor1,
                                ),
                                tween: Tween<double>(
                                    begin: 0.0,
                                    end: (controller.currentPage + 1) / 4),
                                duration: const Duration(milliseconds: 300),
                              ),
                            )),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor1,
                          ),
                          width: 60,
                          height: 60,
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
