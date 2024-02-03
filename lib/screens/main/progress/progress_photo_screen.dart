import 'package:fitness_app/common_widgets/custom_app_bar.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/controllers/progress_controller.dart';
import 'package:fitness_app/helpers/show_dialogs.dart';
import 'package:fitness_app/screens/main/progress/compare_photo_card.dart';
import 'package:fitness_app/screens/main/progress/progress_gallery.dart';
import 'package:fitness_app/screens/main/progress/reminder_widget.dart';
import 'package:fitness_app/screens/main/progress/track_progress_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProgressPhotoScreen extends StatelessWidget {
  ProgressPhotoScreen({super.key});

  final controller = Get.put(ProgressController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Stack(
        children: [
          Column(
            children: [
              const CustomAppBar(title: 'Progress Photo', hasReturnBtn: false,),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      const ReminderWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TrackProgressAd(),
                      SizedBox(
                        height: 20.h,
                      ),
                      const ComparePhotoCard(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gallery",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "see more",
                            style: TextStyle(
                                color: AppColors.gray,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GetBuilder<ProgressController>(
                        builder: (context) {
                          return ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (_, __)=>SizedBox(height: 15.h,),
                            itemCount: controller.imgGroups.length,
                            itemBuilder: (_, index) =>
                                ProgressGallery(imgGroup: controller.imgGroups[index]),
                          );
                        }
                      )
                    ],
                  ))
            ],
          ),
          Positioned(right: 0, bottom: 0, child: GestureDetector(
            onTap: (){
              showImagePickerDialog(context);
            },
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: AppColors.secondaryG
                )
              ),
              child: const Icon(Icons.camera_alt, color: Colors.white,),
            ),
          ))
        ],
      )
    );
  }
}
