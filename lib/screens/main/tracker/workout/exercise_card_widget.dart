import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/exercise_model.dart';
import 'package:fitness_app/screens/main/tracker/workout/exercise_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExerciseCardWidget extends StatelessWidget {
  const ExerciseCardWidget({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (){
          Get.to(()=>ExerciseDetailsScreen(exercise: exercise));
        },
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.withOpacity(0.5))
              ),
              margin: EdgeInsets.only(top: 10.h),
              child: CachedNetworkImage(imageUrl: exercise.img ?? "", imageBuilder: (_, provider)=>Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: provider,
                    fit: BoxFit.cover
                  )
                ),
              ), fit: BoxFit.cover, errorWidget: (_, __, ___)=>Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)
                ),
              )),
            ),
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.name, style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),),
                Text(exercise.difficulty.name.capitalize!, style: TextStyle(
                  fontSize: 12,
                  color: exercise.difficultyColor(),
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondaryColor1)
              ),
              child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.secondaryColor1, size: 15,),
            )
          ],
        ),
      ),
    );
  }
}
