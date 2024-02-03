import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/models/image_group_model.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../helpers/utils_functions.dart';


class ProgressGallery extends StatelessWidget {
  const ProgressGallery({super.key, required this.imgGroup});
  final ImageGroupModel imgGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formatProgressDate(imgGroup.date), style: TextStyle(
            color: AppColors.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 15.h,),
        SizedBox(
          height: 100.h,
          child: ListView.separated(scrollDirection: Axis.horizontal, itemBuilder: (_, index){
            final imgPath = imgGroup.imagePaths[index];
            return GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.photoOverview, arguments: {
                  "imgPath": imgPath
                });
              },
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(imgPath),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            );
          }, itemCount:  imgGroup.imagePaths.length, separatorBuilder: (_, __)=>SizedBox(width: 10.w,),),
        )
      ],
    );
  }
}
