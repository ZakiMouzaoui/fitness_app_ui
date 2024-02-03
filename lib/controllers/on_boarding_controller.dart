import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/on_boarding_model.dart';

class OnBoardingController extends GetxController {
  int currentPage = 0;
  final PageController controller = PageController();

  final models = [
    const OnBoardingModel(
        img: "assets/img/on_1.png",
        title: "Track Your Goal",
        subtitle:
            "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"),
    const OnBoardingModel(
        img: "assets/img/on_2.png",
        title: "Get Burn",
        subtitle:
            "Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever"),
    const OnBoardingModel(
        img: "assets/img/on_3.png",
        title: "Eat Well",
        subtitle:
            "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"),
    const OnBoardingModel(
        img: "assets/img/on_4.png",
        title: "Improve Sleep Quality",
        subtitle:
            "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning"),
  ];

  void moveToPage(int index) {
    currentPage = index;
    update();
  }
}
