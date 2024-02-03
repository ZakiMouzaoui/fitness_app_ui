import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/main/home/latest_activity_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_app_bar.dart';

class ActivityTracker extends StatefulWidget {
  const ActivityTracker({super.key});

  @override
  State<ActivityTracker> createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final menuItems = ["Weekly", "Monthly"];

    final List latestActivities = [
      {
        "title": "Drinking 300ml water",
        "time": "About 3 minutes ago",
        "img": "assets/img/pic_4.png"
      },
      {
        "title": "Eat Snack(FitBar)",
        "time": "About 10 minutes ago",
        "img": "assets/img/pic_5.png"
      }
    ];

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            const CustomAppBar(title: "Activity Tracker"),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor1.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Target",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.primaryG,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/img/bottle.png",
                              width: 15.w,
                              height: 35.h,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "8L",
                                  style: TextStyle(
                                      color: AppColors.primaryColor1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Water Intake",
                                  style: TextStyle(
                                      color: AppColors.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.directions_run,
                              color: Colors.amber,
                              size: 32,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2400",
                                  style: TextStyle(
                                      color: AppColors.primaryColor1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Foot Steps",
                                  style: TextStyle(
                                      color: AppColors.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Workout Progress",
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Container(
                    height: 25.h,
                    padding: EdgeInsets.only(left: 10.w, right: 5.w),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: AppColors.primaryG),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          selectedItemBuilder: (_) => [
                                DropdownMenuItem(
                                    child: Text(
                                  menuItems[0],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ))
                              ],
                          style: TextStyle(
                              color: AppColors.black, fontFamily: "Poppins"),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          value: 0,
                          items: List.generate(
                              2,
                              (index) => DropdownMenuItem(
                                    value: index,
                                    child: Text(
                                      menuItems[index],
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                          onChanged: (val) {}),
                    )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(height: 200.h, child: BarChart(mainBarData())),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Activity",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "See more",
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
            Expanded(
                child: ListView.separated(
                    itemBuilder: (_, index) => LatestActivityCard(
                        bgColor: index % 2 == 0
                            ? AppColors.primaryColor1
                            : AppColors.secondaryColor2,
                        img: latestActivities[index]["img"],
                        title: latestActivities[index]["title"],
                        time: latestActivities[index]["time"]),
                    separatorBuilder: (_, __) => SizedBox(
                          height: 5.h,
                        ),
                    itemCount: latestActivities.length))
          ],
        ),
      ),
    ));
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 25,
    List<int> showTooltips = const [],
  }) {
    barColor ??= AppColors.primaryColor1;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: AppColors.primaryColor1,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: AppColors.primaryColor1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: 0,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 1:
                weekDay = 'Monday';
                break;
              case 2:
                weekDay = 'Tuesday';
                break;
              case 3:
                weekDay = 'Wednesday';
                break;
              case 4:
                weekDay = 'Thursday';
                break;
              case 5:
                weekDay = 'Friday';
                break;
              case 6:
                weekDay = 'Saturday';
                break;
              case 0:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: AppColors.primaryColor2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
