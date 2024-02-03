import 'exercise_model.dart';

class Workout {
  final String name;
  final String img;
  final String? cover;
  final int duration;
  final int numExercises;
  final double caloriesBurned;
  final List<Exercise> exercises;

  Workout({
    required this.name,
    this.cover,
    required this.img,
    required this.duration,
    required this.numExercises,
    required this.caloriesBurned,
    required this.exercises,
  });
}