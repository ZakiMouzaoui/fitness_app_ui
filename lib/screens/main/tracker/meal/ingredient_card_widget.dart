import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientCardWidget extends StatelessWidget {
  const IngredientCardWidget({super.key, required this.ingredient});

  final Ingredient ingredient;
  
  String removeTrailingZero(double value) {
    String stringValue = value.toString();

    if (stringValue.endsWith('.0')) {
      stringValue = stringValue.substring(0, stringValue.length - 2);
    }

    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: ingredient.icon!,
          ),
        ),
        SizedBox(
          width: 100.w,
          child: Text(ingredient.name, style: TextStyle(
            color: AppColors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400
          ), textAlign: TextAlign.center, maxLines: 2,),
        ),
        //const Spacer(),
        Text("(${removeTrailingZero(ingredient.quantity)} ${ingredient.unit})", style: TextStyle(
            color: AppColors.gray,
            fontSize: 12,
            fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}
