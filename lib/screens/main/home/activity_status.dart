import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';


class ActivityStatus extends StatefulWidget {
  const ActivityStatus({super.key});

  @override
  State<ActivityStatus> createState() => _ActivityStatusState();
}

class _ActivityStatusState extends State<ActivityStatus> {
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
    FlSpot(0, 20),
    FlSpot(1, 25),
    FlSpot(2, 40),
    FlSpot(3, 50),
    FlSpot(4, 35),
    FlSpot(5, 40),
    FlSpot(6, 30),
    FlSpot(7, 20),
    FlSpot(8, 25),
    FlSpot(9, 40),
    FlSpot(10, 50),
    FlSpot(11, 35),
    FlSpot(12, 50),
    FlSpot(13, 60),
    FlSpot(14, 40),
    FlSpot(15, 50),
    FlSpot(16, 20),
    FlSpot(17, 25),
    FlSpot(18, 40),
    FlSpot(19, 50),
    FlSpot(20, 35),
    FlSpot(21, 80),
    FlSpot(22, 30),
    FlSpot(23, 20),
    FlSpot(24, 25),
    FlSpot(25, 40),
    FlSpot(26, 50),
    FlSpot(27, 35),
    FlSpot(28, 50),
    FlSpot(29, 60),
    FlSpot(30, 40)
  ];

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            AppColors.primaryColor2.withOpacity(0.4),
            AppColors.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: AppColors.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor1.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(top: 0, child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Heart Rate",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "78 BPM",
                  style: TextStyle(
                      color: AppColors.primaryColor1.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),),
          SizedBox(
              height: 180.h,
              child: LineChart(
                LineChartData(
                  showingTooltipIndicators:
                  showingTooltipOnSpots.map((index) {
                    return ShowingTooltipIndicators([
                      LineBarSpot(
                        tooltipsOnBar,
                        lineBarsData.indexOf(tooltipsOnBar),
                        tooltipsOnBar.spots[index],
                      ),
                    ]);
                  }).toList(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchCallback: (FlTouchEvent event,
                        LineTouchResponse? response) {
                      if (response == null ||
                          response.lineBarSpots == null) {
                        return;
                      }
                      if (event is FlTapUpEvent) {
                        final spotIndex =
                            response.lineBarSpots!.first.spotIndex;
                        showingTooltipOnSpots.clear();
                        setState(() {
                          showingTooltipOnSpots.add(spotIndex);
                        });
                      }
                    },
                    mouseCursorResolver: (FlTouchEvent event,
                        LineTouchResponse? response) {
                      if (response == null ||
                          response.lineBarSpots == null) {
                        return SystemMouseCursors.basic;
                      }
                      return SystemMouseCursors.click;
                    },
                    getTouchedSpotIndicator: (LineChartBarData barData,
                        List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          const FlLine(
                            color: Colors.red,
                          ),
                          FlDotData(
                            show: true,
                            getDotPainter:
                                (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                                  radius: 3,
                                  color: Colors.white,
                                  strokeWidth: 3,
                                  strokeColor: AppColors.secondaryColor1,
                                ),
                          ),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: AppColors.secondaryColor1,
                      tooltipRoundedRadius: 20,
                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            "${lineBarSpot.x.toInt()} mins ago",
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: lineBarsData,
                  minY: 0,
                  maxY: 130,
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
