import 'package:fitness_app/screens/main/home/home_screen.dart';
import 'package:fitness_app/screens/main/profile/profile_screen.dart';
import 'package:fitness_app/screens/main/progress/progress_photo_screen.dart';
import 'package:fitness_app/screens/main/tracker/tracker_tab.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController{
  int currentIndex=0;

  final screens = [
    HomeScreen(),
    TrackerTab(),
    ProgressPhotoScreen(),
    ProfileScreen()
  ];

  void changeIndex(int newIdx){
    currentIndex = newIdx;
    update();
  }
}