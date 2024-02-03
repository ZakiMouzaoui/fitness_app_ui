import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/screens/auth/login/login_screen.dart';
import 'package:fitness_app/screens/auth/signup/signup_screen.dart';
import 'package:fitness_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:fitness_app/screens/main/home/activity_tracker.dart';
import 'package:fitness_app/screens/main/home/workout_completed_screen.dart';
import 'package:fitness_app/screens/main/main_view.dart';
import 'package:fitness_app/screens/main/progress/comparison_results.dart';
import 'package:fitness_app/screens/main/progress/comparison_screen.dart';
import 'package:fitness_app/screens/main/progress/photo_overview.dart';
import 'package:fitness_app/screens/main/tracker/sleep/sleep_tracker_screen.dart';
import 'package:fitness_app/screens/main/tracker/workout/workout_details_screen.dart';
import 'package:fitness_app/screens/main/tracker/workout/workout_tracker_screen.dart';
import 'package:fitness_app/screens/notifications/notifications_screen.dart';
import 'package:fitness_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:fitness_app/screens/splash/splash_screen.dart';
import 'package:fitness_app/screens/welcome/welcome_screen.dart';
import 'package:fitness_app/screens/your_goal/your_goal_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoarding = "/on-boarding";
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String completeProfile = "/complete-profile";
  static const String yourGoal = "/your-goal";
  static const String welcome = "/welcome";
  static const String main = "/main";
  static const String notifications = "/notifications";
  static const String workoutComplete = "/workoutComplete";
  static const String photoOverview = "/photoOverview";
  static const String comparison = "/comparison";
  static const String comparisonResults = "/comparisonResults";
  static const String sleepTracker = "/sleepTracker";
  static const String activityTracker = "/activityTracker";
  static const String workoutTracker = "/workoutTracker";
  static const String workoutDetails = "/workoutDetails";

  AppRoutes._();

  static Widget transitionBuilder(_, animation, __, child){
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SplashScreen());
      case onBoarding:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => OnBoardingScreen(),
            transitionsBuilder: transitionBuilder
        );
      case login:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const LoginScreen(),
            transitionsBuilder: transitionBuilder
        );
      case signUp:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SignUpScreen(),
            transitionsBuilder: transitionBuilder
        );
      case completeProfile:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => CompleteProfileScreen(),
            transitionsBuilder: transitionBuilder
        );
      case yourGoal:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => YourGoalScreen(),
            transitionsBuilder: transitionBuilder
        );
      case welcome:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const WelcomeScreen(),
            transitionsBuilder: transitionBuilder
        );
      case main:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => MainView(),
            transitionsBuilder: transitionBuilder
        );
      case notifications:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => NotificationsScreen(),
            transitionsBuilder: transitionBuilder
        );
      case workoutComplete:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const WorkoutCompletedScreen(),
            transitionsBuilder: transitionBuilder
        );
      case photoOverview:
        final String imgPath = (settings.arguments as Map<String, String>)["imgPath"] as String;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => PhotoOverview(imgPath: imgPath),
        );
      case comparison:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ComparisonScreen(),
            transitionsBuilder: transitionBuilder
        );
      case comparisonResults:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ComparisonResultsScreen(),
            transitionsBuilder: transitionBuilder
        );
      case sleepTracker:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SleepTrackerScreen(),
            transitionsBuilder: transitionBuilder
        );
      case activityTracker:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const ActivityTracker(),
            transitionsBuilder: transitionBuilder
        );
      case workoutTracker:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => WorkoutTracker(),
            transitionsBuilder: transitionBuilder
        );
      case workoutDetails:
        final Map<String, Workout> arguments = settings.arguments as Map<String, Workout>;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => WorkoutDetailsScreen(workout: arguments["workout"]!),
            transitionsBuilder: transitionBuilder
        );
      default:
      // Handle unknown routes here
        return null;
    }
  }
}
