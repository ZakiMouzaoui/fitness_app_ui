import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/common_widgets/custom_text_field.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/screens/main/tracker/meal/food_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: meal.name),
              SizedBox(
                height: 15.h,
              ),
              const CustomTextField(
                  hint: "Search food", prefixIcon: Icons.search),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Recommendations for you",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.h,
              ),
              /*
              SizedBox(height: 250.h,child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index)=>FoodCardWidget(food: meal.foods[index], index: index,),
                  separatorBuilder: (_, __)=>SizedBox(width: 15.w,),
                  itemCount: meal.foods.length
              ),)
               */
              StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  children: meal.foods.asMap().entries.map((e) => FoodCardWidget(food: e.value, index: e.key)).toList(),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
