class MealSchedule{
  final String meal;
  final List<Food> foods;
  final DateTime date;

  const MealSchedule({required this.meal, required this.foods, required this.date});
}

class Meal{
  final String name; // EXAMPLE BREAKFAST, LAUNCH, DINNER, SNACK
  final List<Food> foods;
  final String icon;

  const Meal({required this.name, required this.foods, required this.icon});
}

class Food{
  final String name;
  final String img;
  final List<Ingredient> ingredients;
  final int totalCalories;
  final int protein;
  final int fat;
  final int carbs;
  final String description;
  final List<FoodPreparation> steps;

  const Food({required this.name, required this.img, required this.ingredients, required this.totalCalories, required this.description, required this.steps, required this.carbs, required this.fat, required this.protein});
}

class FoodPreparation{
  final String title;
  final String content;

  const FoodPreparation({required this.title, required this.content});
}

class Ingredient {
  final String name;
  final double quantity;
  final String unit;
  final String? icon;


  const Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
    this.icon
  });
}
