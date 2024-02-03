import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/utils_functions.dart';


class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: notificationModel.bgColor.withOpacity(0.4),
          radius: 25,
        ),
        SizedBox(width: 10.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 220.w,
              child: Text(notificationModel.content, style: TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500
              ), overflow: TextOverflow.ellipsis,),
            ),
            Text(formatTimeAgo(notificationModel.date), style: TextStyle(
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
                fontSize: 10
              ), overflow: TextOverflow.ellipsis,),

          ],
        ),
        const Spacer(),
        Icon(Icons.more_vert_rounded, color: AppColors.gray,)
      ],
    );
  }
}
