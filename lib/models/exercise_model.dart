import 'package:flutter/material.dart';

class Exercise{
  final String name;
  final String? img;
  final String? videoId;
  final int sets;
  final ExerciseDifficulty difficulty;
  final String description;
  final List<ExerciseMaterial> materialNeeded;
  final List<ExerciseStep> howItsDone;

  Exercise({
    required this.name,
    this.img,
    this.videoId,
    required this.sets,
    required this.difficulty,
    required this.description,
    required this.materialNeeded,
    required this.howItsDone,
  });

  Color difficultyColor(){
    switch(difficulty){
      case ExerciseDifficulty.beginner:
        return Colors.green;
      case ExerciseDifficulty.intermediate:
        return Colors.amber[600]!;
      case ExerciseDifficulty.advanced:
        return Colors.red;
    }
  }
}

class ExerciseStep {
  final String title;
  final String description;

  ExerciseStep({required this.title, required this.description});
}

class ExerciseMaterial {
  final String title;
  final String image;

  ExerciseMaterial({required this.title, required this.image});
}

enum ExerciseDifficulty{
  beginner,
  intermediate,
  advanced
}

extension ExerciseDifficultyString on String {
  ExerciseDifficulty get difficulty {
    switch (this) {
      case 'Beginner':
        return ExerciseDifficulty.beginner;
      case 'Intermediate':
        return ExerciseDifficulty.intermediate;
      case 'Advanced':
        return ExerciseDifficulty.advanced;
      default:
        return ExerciseDifficulty.beginner;
    }
  }
}