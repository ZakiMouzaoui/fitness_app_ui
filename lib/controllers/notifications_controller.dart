import 'package:fitness_app/constants/colors.dart';
import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationsController extends GetxController{
  List<NotificationModel> notifications = [
    NotificationModel(content: "Hey, it’s time for lunch", date: DateTime.now(), img: "", bgColor: AppColors.primaryColor1),
    NotificationModel(content: "Don’t miss your lower body workout", date: DateTime(2024, 01, 5), img: "", bgColor: AppColors.primaryColor2),
    NotificationModel(content: "Hey, let’s add some meals for your breakfast", date: DateTime(2023, 12, 20), img: "", bgColor: AppColors.primaryColor1),
    NotificationModel(content: "Congratulations, You have finished a full body workout", date: DateTime(2023, 10, 29), img: "", bgColor: AppColors.primaryColor1),
    NotificationModel(content: "Hey, it’s time for lunch", date: DateTime(2022, 07, 16), img: "", bgColor: AppColors.primaryColor2),
    NotificationModel(content: "Ups, You have missed your Lower body workout", date:DateTime(2022, 04, 26), img: "", bgColor: AppColors.primaryColor2),
  ];
}