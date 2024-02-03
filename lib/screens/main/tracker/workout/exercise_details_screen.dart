import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/models/exercise_model.dart';
import 'package:fitness_app/screens/main/tracker/workout/exercise_step_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../constants/colors.dart';
import 'package:readmore/readmore.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  const ExerciseDetailsScreen({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.exercise.videoId ?? "EzvnMZuxGWw",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
        loop: true,
      ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
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
                      Icons.close,
                      color: AppColors.black,
                      size: 16,
                    ),
                  ),
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
            SizedBox(
              height: 20.h,
            ),
            YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) => player),
            SizedBox(
              height: 15.h,
            ),
            Text(
              widget.exercise.name,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "${widget.exercise.difficulty.name.capitalize}",
              style: TextStyle(
                  color: widget.exercise.difficultyColor(),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Description",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            ReadMoreText(
              widget.exercise.description,
              trimMode: TrimMode.Line,
              trimLines: 4,
              trimCollapsedText: 'read more',
              trimExpandedText: 'read less',
              delimiter: " ",
              style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              moreStyle: TextStyle(
                  color: AppColors.primaryColor1, fontWeight: FontWeight.w500),
              lessStyle: TextStyle(
                  color: AppColors.primaryColor1, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "You Will Need",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${widget.exercise.materialNeeded.length} item(s)',
                  style: TextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            SizedBox(
              height: 130.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  itemBuilder: (_, index) => Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color:  AppColors.lightGray,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(widget.exercise.materialNeeded[index].image),
                            )
                        ),

                      ),
                      SizedBox(height: 10.h,),
                      Text(widget.exercise.materialNeeded[index].title, style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),)
                    ],
                  ),
                  separatorBuilder: (_, __) => SizedBox(
                        width: 10.w,
                      ),
                  itemCount: widget.exercise.materialNeeded.length),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "How To Do It",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${widget.exercise.howItsDone.length} steps',
                  style: TextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (_, index) => ExerciseStepWidget(
                step: widget.exercise.howItsDone[index],
                index: index + 1,
              ),
              itemCount: widget.exercise.howItsDone.length,
              separatorBuilder: (_, __) => SizedBox(
                height: 10.h,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
