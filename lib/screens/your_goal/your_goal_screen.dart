import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:fitness_app/common_widgets/custom_button.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/goal_model.dart';
import 'package:fitness_app/routes.dart';
import 'package:fitness_app/screens/your_goal/goal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourGoalScreen extends StatelessWidget {
  YourGoalScreen({super.key});

  final goals = [
    const GoalModel(
        img: "assets/img/goal_1.png",
        goal: "Improve Shape",
        description:
            "I have a low amount of body fat and need / want to build more muscle"),
    const GoalModel(
        img: "assets/img/goal_2.png",
        goal: "Lean & Tone",
        description:
            "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way"),
    const GoalModel(
        img: "assets/img/goal_3.png",
        goal: "Lose a Fat",
        description:
            "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass")
  ];

  final TransformerPageController controller = TransformerPageController(
    viewportFraction: 0.8,
    initialPage: 0,
    itemCount: 3,
    loop: true
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 0.072 * w, vertical: 0.043 * h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 1, child: Column(
              children: [
                Text(
                  "What is your goal?",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "It will help us to choose a best program for you",
                  style: TextStyle(color: AppColors.gray, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            SizedBox(
              height: 0.05 * h,
            ),
            
              Expanded(
                flex: 8,
              child: TransformerPageView(
                  pageController: controller,
                  loop: true,
                  itemCount: 3,
                  transformer: ScaleAndFadeTransformer(),
                  viewportFraction: 0.7,
                  itemBuilder: (_, index) => GoalCard(goalModel: goals[index])),
            ),
            const Spacer(flex: 2,),
            //SizedBox(height: 0.12*h,),
            Expanded(flex: 1, child: Container(
              alignment: Alignment.center,
              child: CustomButton(title: "Confirm", onPressed: (){
                Get.toNamed(AppRoutes.welcome);
              }),
            )),
          ],
        ),
      ),
    ));
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade= 0.3, double scale= 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double? position = info.position;
    double scaleFactor = (1 - position!.abs()) * (1 - _scale);
    double fadeFactor = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFactor;
    double scale = _scale + scaleFactor;
    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: child,
      ),
    );
  }
}