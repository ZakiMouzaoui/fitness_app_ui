import 'package:fitness_app/models/workout_model.dart';

class WorkoutSchedule{
  WorkoutSchedule({required this.workout, this.isDone=false, required this.date, required this.shouldNotify});

  final Workout workout;
  final DateTime date;
  final bool? isDone;
  final bool? shouldNotify;
}