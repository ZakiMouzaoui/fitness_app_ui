import 'package:get/get.dart';

import '../models/meal_model.dart';

class FoodController extends GetxController {
  static FoodController get instance => Get.find();

  final List<Food> foods = [
    const Food(
      name: "Avocado Toast",
      img: "https://thesaltypot.com/wp-content/uploads/2019/02/Avocado-Toast09.jpg",
      ingredients: [
        Ingredient(name: "Avocado", quantity: 1, unit: "piece", icon: "https://cdn3.iconfinder.com/data/icons/fruits-8/512/avocado-1024.png"),
        Ingredient(name: "Whole Grain Bread", quantity: 2, unit: "slices", icon: "https://th.bing.com/th/id/R.fef68aa026f70d41ecbe286a0122b200?rik=LSfNQh7hNiOE0g&riu=http%3a%2f%2fwww.iconshock.com%2fimg_vista%2fFLAT%2ffood%2fjpg%2fwhole_grain_bread_icon.jpg&ehk=M%2b4uXsDF9kD%2fu4aom3ZO517hzIgW%2bM0ZvwHcJbsOKgs%3d&risl=&pid=ImgRaw&r=0"),
        Ingredient(name: "Egg", quantity: 1, unit: "piece", icon: "https://th.bing.com/th/id/R.a8a5d1a0673202f077b9956ca9b5033b?rik=xe6LhRy5OMW8%2fg&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fgoogle%2fnoto-emoji-food-drink%2f1024%2f32390-egg-icon.png&ehk=iYh%2bC%2fovct80ZgumQbcyUvYbHBS6PlOvC%2bGJ7aNNja8%3d&risl=&pid=ImgRaw&r=0"),
      ],
      totalCalories: 300,
      protein: 10,
      fat: 15,
      carbs: 30,
      description: "A classic breakfast with creamy avocado spread on whole grain toast, topped with a perfectly poached egg.",
      steps: [
        FoodPreparation(title: "Mash Avocado", content: "Mash the avocado into a creamy spread."),
        FoodPreparation(title: "Toast Bread", content: "Toast the whole grain bread slices."),
        FoodPreparation(title: "Poach Egg", content: "Poach the egg to perfection."),
        FoodPreparation(title: "Assemble", content: "Spread mashed avocado on toast and top with the poached egg."),
      ],
    ),
    const Food(
      name: "Greek Yogurt Parfait",
      img: "https://simplyhomecooked.com/wp-content/uploads/2015/07/berry-parfait-4.jpg",
      ingredients: [
        Ingredient(name: "Greek Yogurt", quantity: 1, unit: "cup", icon: "https://cdn-icons-png.flaticon.com/512/8887/8887323.png"),
        Ingredient(name: "Berries", quantity: 0.5, unit: "cup", icon: "https://cdn0.iconfinder.com/data/icons/fruit-57/64/Blueberries-Blueberry-fruit-512.png"),
        Ingredient(name: "Granola", quantity: 0.25, unit: "cup", icon: "https://cdn0.iconfinder.com/data/icons/foods-49/128/breakfast_porridge_oatmeal_granola-512.png"),
      ],
      totalCalories: 250,
      protein: 15,
      fat: 8,
      carbs: 30,
      description: "A refreshing parfait featuring thick Greek yogurt layered with fresh berries and crunchy granola.",
      steps: [
        FoodPreparation(title: "Layer Yogurt", content: "Layer Greek yogurt in a glass or bowl."),
        FoodPreparation(title: "Add Berries", content: "Top with fresh berries."),
        FoodPreparation(title: "Sprinkle Granola", content: "Sprinkle crunchy granola on top."),
      ],
    ),
    const Food(
      name: "Scrambled Eggs with Veggies",
      img: "https://www.preciouscore.com/wp-content/uploads/2021/01/Scrambled-Eggs-With-Vegetables-683x1024.jpg",
      ingredients: [
        Ingredient(name: "Eggs", quantity: 2, unit: "pieces", icon: "https://th.bing.com/th/id/R.a8a5d1a0673202f077b9956ca9b5033b?rik=xe6LhRy5OMW8%2fg&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fgoogle%2fnoto-emoji-food-drink%2f1024%2f32390-egg-icon.png&ehk=iYh%2bC%2fovct80ZgumQbcyUvYbHBS6PlOvC%2bGJ7aNNja8%3d&risl=&pid=ImgRaw&r=0"),
        Ingredient(name: "Bell Peppers", quantity: 0.5, unit: "cup", icon: "https://cdn-icons-png.flaticon.com/512/766/766020.png"),
        Ingredient(name: "Spinach", quantity: 0.25, unit: "cup", icon: "https://cdn-icons-png.flaticon.com/512/8945/8945305.png"),
        Ingredient(name: "Cheese", quantity: 0.25, unit: "cup", icon: "https://i.pinimg.com/originals/95/58/22/955822ef94b910ca895c242c3bf3192d.png"),
      ],
      totalCalories: 280,
      protein: 15,
      fat: 20,
      carbs: 5,
      description: "A protein-packed breakfast with fluffy scrambled eggs loaded with colorful bell peppers, spinach, and melted cheese.",
      steps: [
        FoodPreparation(title: "Whisk Eggs", content: "Whisk the eggs in a bowl."),
        FoodPreparation(title: "Sauté Veggies", content: "Sauté bell peppers and spinach until tender."),
        FoodPreparation(title: "Add Eggs", content: "Pour whisked eggs over veggies and stir."),
        FoodPreparation(title: "Melt Cheese", content: "Sprinkle cheese on top and let it melt."),
      ],
    ),
    const Food(
      name: "Banana Nut Overnight Oats",
      img: "https://www.thehealthymaven.com/wp-content/uploads/2016/02/Banana-Nut-Overnight-Oats-1.jpg",
      ingredients: [
        Ingredient(name: "Rolled Oats", quantity: 0.5, unit: "cup"),
        Ingredient(name: "Almond Milk", quantity: 0.5, unit: "cup"),
        Ingredient(name: "Banana", quantity: 1, unit: "piece"),
        Ingredient(name: "Walnuts", quantity: 0.25, unit: "cup"),
      ],
      totalCalories: 320,
      protein: 10,
      fat: 15,
      carbs: 40,
      description: "A nutritious and convenient breakfast with rolled oats soaked in almond milk, topped with sliced banana and walnuts.",
      steps: [
        FoodPreparation(title: "Combine Oats and Milk", content: "Mix rolled oats and almond milk in a jar."),
        FoodPreparation(title: "Add Banana", content: "Slice banana and add to the oats."),
        FoodPreparation(title: "Top with Walnuts", content: "Sprinkle chopped walnuts on top."),
        FoodPreparation(title: "Refrigerate Overnight", content: "Let it sit in the refrigerator overnight."),
      ],
    ),
    const Food(
      name: "Peanut Butter Banana Smoothie",
      img: "https://bing.com/th?id=OSK.bc965963e0b7438b0c7aeac148f71453",
      ingredients: [
        Ingredient(name: "Banana", quantity: 1, unit: "piece", icon: "https://th.bing.com/th/id/R.6c2a4c596bd09e65a89d30457756f067?rik=dj0ju9SQ3l%2bxwQ&pid=ImgRaw&r=0"),
        Ingredient(name: "Peanut Butter", quantity: 2, unit: "tablespoons", icon: "https://cdn-icons-png.flaticon.com/512/734/734780.png"),
        Ingredient(name: "Greek Yogurt", quantity: 0.5, unit: "cup", icon: "https://cdn-icons-png.flaticon.com/512/8887/8887323.png"),
        Ingredient(name: "Almond Milk", quantity: 1, unit: "cup", icon: "https://cdn-icons-png.flaticon.com/512/5601/5601420.png"),
      ],
      totalCalories: 280,
      protein: 12,
      fat: 15,
      carbs: 30,
      description: "A creamy and protein-rich smoothie featuring the classic combination of banana and peanut butter blended with Greek yogurt and almond milk.",
      steps: [
        FoodPreparation(title: "Blend Ingredients", content: "Blend banana, peanut butter, Greek yogurt, and almond milk until smooth."),
        FoodPreparation(title: "Pour and Enjoy", content: "Pour the smoothie into a glass and enjoy immediately."),
      ],
    ),
    const Food(
      name: "Chicken Caesar Wrap",
      img: "https://th.bing.com/th/id/OIP.96mdJ73pz__z2jZIVWhDTgHaLH?rs=1&pid=ImgDetMain",
      ingredients: [
        Ingredient(name: "Grilled Chicken", quantity: 1, unit: "breast"),
        Ingredient(name: "Romaine Lettuce", quantity: 1, unit: "cup"),
        Ingredient(name: "Cherry Tomatoes", quantity: 0.5, unit: "cup"),
        Ingredient(name: "Caesar Dressing", quantity: 2, unit: "tablespoons"),
        Ingredient(name: "Whole Wheat Wrap", quantity: 1, unit: "piece"),
      ],
      totalCalories: 380,
      protein: 25,
      fat: 15,
      carbs: 35,
      description: "A satisfying lunch wrap with grilled chicken, crisp romaine lettuce, cherry tomatoes, and Caesar dressing wrapped in a whole wheat wrap.",
      steps: [
        FoodPreparation(title: "Grill Chicken", content: "Grill the chicken breast until fully cooked."),
        FoodPreparation(title: "Prepare Wrap", content: "Lay out the whole wheat wrap and assemble with grilled chicken, lettuce, tomatoes, and Caesar dressing."),
        FoodPreparation(title: "Wrap and Enjoy", content: "Roll the ingredients into a wrap and enjoy."),
      ],
    ),
    const Food(
      name: "Quinoa Salad Bowl",
      img: "https://th.bing.com/th/id/OIP._9LFz16g1J-1D6i6pz73AAHaLH?rs=1&pid=ImgDetMain",
      ingredients: [
        Ingredient(name: "Quinoa", quantity: 1, unit: "cup"),
        Ingredient(name: "Mixed Vegetables", quantity: 1, unit: "cup"),
        Ingredient(name: "Feta Cheese", quantity: 0.25, unit: "cup"),
        Ingredient(name: "Balsamic Vinaigrette", quantity: 2, unit: "tablespoons"),
      ],
      totalCalories: 350,
      protein: 12,
      fat: 18,
      carbs: 40,
      description: "A nourishing quinoa bowl featuring a medley of mixed vegetables, feta cheese, and a drizzle of balsamic vinaigrette.",
      steps: [
        FoodPreparation(title: "Cook Quinoa", content: "Cook quinoa according to package instructions."),
        FoodPreparation(title: "Roast Vegetables", content: "Roast mixed vegetables until tender."),
        FoodPreparation(title: "Assemble Bowl", content: "Combine cooked quinoa, roasted vegetables, and crumbled feta cheese. Drizzle with balsamic vinaigrette."),
      ],
    ),
    const Food(
      name: "Turkey Avocado Club Wrap",
      img: "https://www.chelseasmessyapron.com/wp-content/uploads/2017/03/Turkey-Ranch-Wraps-768x1152.jpg",
      ingredients: [
        Ingredient(name: "Turkey Slices", quantity: 4, unit: "slices"),
        Ingredient(name: "Avocado", quantity: 0.5, unit: "piece"),
        Ingredient(name: "Bacon Strips", quantity: 2, unit: "strips"),
        Ingredient(name: "Lettuce", quantity: 1, unit: "cup"),
        Ingredient(name: "Whole Wheat Wrap", quantity: 1, unit: "piece"),
      ],
      totalCalories: 320,
      protein: 20,
      fat: 15,
      carbs: 25,
      description: "A delicious club wrap with layers of turkey slices, creamy avocado, crispy bacon, and fresh lettuce wrapped in a whole wheat wrap.",
      steps: [
        FoodPreparation(title: "Cook Bacon", content: "Cook bacon strips until crispy."),
        FoodPreparation(title: "Assemble Wrap", content: "Lay out the whole wheat wrap and assemble with turkey slices, sliced avocado, bacon, and lettuce."),
        FoodPreparation(title: "Wrap and Enjoy", content: "Roll the ingredients into a wrap and enjoy."),
      ],
    ),
    const Food(
      name: "Grilled Salmon with Lemon Herb Sauce",
      img: "https://www.savingdessert.com/wp-content/uploads/2019/06/Lemon-Herb-Marinated-Grilled-Salmon-4-800x1200.jpg",
      ingredients: [
        Ingredient(name: "Salmon Fillet", quantity: 1, unit: "piece"),
        Ingredient(name: "Lemon", quantity: 1, unit: "piece"),
        Ingredient(name: "Fresh Herbs (Rosemary, Thyme)", quantity: 2, unit: "tablespoons"),
        Ingredient(name: "Olive Oil", quantity: 1, unit: "tablespoon"),
      ],
      totalCalories: 320,
      protein: 26,
      fat: 18,
      carbs: 10,
      description: "Grilled salmon fillet topped with a zesty lemon herb sauce. A light and flavorful dinner option.",
      steps: [
        FoodPreparation(title: "Grill Salmon", content: "Grill the salmon fillet until fully cooked."),
        FoodPreparation(title: "Prepare Sauce", content: "Mix fresh herbs with olive oil and lemon juice for the sauce."),
        FoodPreparation(title: "Top and Serve", content: "Top the grilled salmon with the lemon herb sauce before serving."),
      ],
    ),
    const Food(
      name: "Vegetarian Chickpea StirFry",
      img: "https://th.bing.com/th/id/OIP.otjt-_1l3_uH0PXqP_2ZeAHaLH?rs=1&pid=ImgDetMain",
      ingredients: [
        Ingredient(name: "Chickpeas", quantity: 1, unit: "cup"),
        Ingredient(name: "Mixed Vegetables (Broccoli, Bell Peppers, Carrots)", quantity: 1, unit: "cup"),
        Ingredient(name: "Soy Sauce", quantity: 2, unit: "tablespoons"),
        Ingredient(name: "Garlic", quantity: 2, unit: "cloves"),
      ],
      totalCalories: 280,
      protein: 15,
      fat: 10,
      carbs: 35,
      description: "A protein-packed vegetarian stir-fry with chickpeas and a variety of colorful vegetables in a savory soy sauce.",
      steps: [
        FoodPreparation(title: "Sauté Chickpeas", content: "Sauté chickpeas until golden brown."),
        FoodPreparation(title: "Stir-Fry Vegetables", content: "Stir-fry mixed vegetables until tender."),
        FoodPreparation(title: "Add Soy Sauce", content: "Pour soy sauce over the mixture and stir."),
      ],
    ),
    const Food(
      name: "Mushroom Risotto with Parmesan",
      img: "https://th.bing.com/th/id/OIP.Uko48N_et13w6UlPgPdcOgHaE-?rs=1&pid=ImgDetMain",
      ingredients: [
        Ingredient(name: "Arborio Rice", quantity: 1, unit: "cup"),
        Ingredient(name: "Mushrooms", quantity: 1, unit: "cup"),
        Ingredient(name: "Onion", quantity: 1, unit: "piece"),
        Ingredient(name: "Parmesan Cheese", quantity: 0.5, unit: "cup"),
      ],
      totalCalories: 380,
      protein: 12,
      fat: 15,
      carbs: 50,
      description: "Creamy mushroom risotto cooked with Arborio rice and topped with grated Parmesan cheese. A comforting and satisfying dinner.",
      steps: [
        FoodPreparation(title: "Cook Rice", content: "Cook Arborio rice according to package instructions."),
        FoodPreparation(title: "Sauté Mushrooms", content: "Sauté mushrooms and diced onion until tender."),
        FoodPreparation(title: "Combine and Serve", content: "Combine cooked rice with sautéed mushrooms and top with Parmesan cheese."),
      ],
    ),
    const Food(
      name: "Baked Chicken with Roasted Vegetables",
      img: "https://th.bing.com/th/id/OIP.omaYEltJtQDn0YETKp0N0wHaK-?rs=1&pid=ImgDetMain",
      ingredients: [
        Ingredient(name: "Chicken Breast", quantity: 1, unit: "piece"),
        Ingredient(name: "Potatoes", quantity: 2, unit: "pieces"),
        Ingredient(name: "Carrots", quantity: 1, unit: "cup"),
        Ingredient(name: "Olive Oil", quantity: 2, unit: "tablespoons"),
      ],
      totalCalories: 340,
      protein: 28,
      fat: 12,
      carbs: 25,
      description: "Tender baked chicken breast served with roasted potatoes and carrots. A wholesome and balanced dinner choice.",
      steps: [
        FoodPreparation(title: "Bake Chicken", content: "Bake the chicken breast until fully cooked."),
        FoodPreparation(title: "Roast Vegetables", content: "Toss potatoes and carrots in olive oil and roast until golden."),
        FoodPreparation(title: "Serve", content: "Serve the baked chicken with roasted vegetables."),
      ],
    ),
    const Food(
      name: "Spicy Shrimp Pasta",
      img: "https://th.bing.com/th/id/R.9f9796acc3069c8bb226c89ac42dc55d?rik=21DuTtP4HB6PZA&pid=ImgRaw&r=0",
      ingredients: [
        Ingredient(name: "Shrimp", quantity: 8, unit: "pieces"),
        Ingredient(name: "Linguine Pasta", quantity: 6, unit: "ounces"),
        Ingredient(name: "Tomatoes", quantity: 1, unit: "cup"),
        Ingredient(name: "Chili Flakes", quantity: 1, unit: "teaspoon"),
      ],
      totalCalories: 300,
      protein: 20,
      fat: 10,
      carbs: 40,
      description: "A flavorful and spicy shrimp pasta dish with juicy tomatoes and a kick of chili flakes. Perfect for those who enjoy a bit of heat.",
      steps: [
        FoodPreparation(title: "Cook Pasta", content: "Cook linguine pasta according to package instructions."),
        FoodPreparation(title: "Sauté Shrimp", content: "Sauté shrimp until pink and cooked."),
        FoodPreparation(title: "Add Tomatoes", content: "Add diced tomatoes and chili flakes to the shrimp."),
      ],
    )
  ];

  late final List<Meal> meals = [
    Meal(
        name: "Breakfast",
        foods: [foods[0],foods[1],foods[2],foods[3],foods[4]],
        icon:
            "https://th.bing.com/th/id/R.5433a242ce93c40aeecd560c4220dc9f?rik=od5ejhxlPjUYQQ&riu=http%3a%2f%2fwww.clipartbest.com%2fcliparts%2fKin%2fLAg%2fKinLAgLyT.png&ehk=RdXP9xKLTkHTn8BLM79wB8QAoeKzXHf7F2359cDznnk%3d&risl=&pid=ImgRaw&r=0"),
    Meal(
        name: "Launch",
        foods: [
          foods[5],
          foods[6],
          foods[7]
        ],
        icon:
        "https://cdn-icons-png.flaticon.com/512/4802/4802503.png"),
    Meal(
        name: "Dinner",
        foods: [
          foods[8],
          foods[9],
          foods[10],
          foods[11],
          foods[12],
        ],
        icon:
        "https://cdn0.iconfinder.com/data/icons/restaurant-128/64/Dinner-meal-food-drink-restaurant-512.png"),
    const Meal(
        name: "Snack",
        foods: [],
        icon:
        "https://cdn-icons-png.flaticon.com/512/3082/3082058.png"),
  ];
}
