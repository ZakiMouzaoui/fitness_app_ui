import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/screens/main/tracker/meal/food_nutrition_card.dart';
import 'package:fitness_app/screens/main/tracker/meal/food_steps.dart';
import 'package:fitness_app/screens/main/tracker/meal/ingredient_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.primaryG)),
          child: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder: (_, __) => [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.black,
                          size: 16,
                        ),
                      ),
                    ),
                    Text(
                      food.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: AppColors.black,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              SliverAppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  expandedHeight: 180.h,
                  flexibleSpace: Center(
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(food.img),
                      radius: 100,
                    ),
                  )),
            ],
            body: Container(
              margin: EdgeInsets.only(top: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 55.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            color: AppColors.gray.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      food.name,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Nutrition",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 35.h,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          FoodNutritionCard(
                              amount: food.totalCalories,
                              iconPath: "burn.png",
                              nutriment: "Kcal"),
                          SizedBox(
                            width: 8.w,
                          ),
                          FoodNutritionCard(
                            amount: food.fat,
                            iconPath: "egg.png",
                            unit: "g",
                            nutriment: "fat",
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          FoodNutritionCard(
                            amount: food.protein,
                            iconPath: "chicken.png",
                            unit: "g",
                            nutriment: "proteins",
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          FoodNutritionCard(
                            amount: food.carbs,
                            iconPath: "carbo.png",
                            unit: "g",
                            nutriment: "carbs",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      food.description,
                      style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Ingredients that you will need",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 160.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => IngredientCardWidget(
                              ingredient: food.ingredients[index]),
                          separatorBuilder: (_, __)=>SizedBox(width: 10.w,),
                          itemCount: food.ingredients.length),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Step by step", style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),),
                        Text('${food.steps.length} steps', style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    FoodSteps(steps: food.steps)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
