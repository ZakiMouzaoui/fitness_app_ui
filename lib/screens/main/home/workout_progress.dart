import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/main/home/progress_chart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutProgress extends StatefulWidget {
  const WorkoutProgress({super.key});

  @override
  State<WorkoutProgress> createState() => _WorkoutProgressState();
}

class _WorkoutProgressState extends State<WorkoutProgress> {
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
    final menuItems = ["Weekly", "Monthly"];

    return Column(
      children: [
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
        SizedBox(height: 30.h,),
        const ProgressChartWidget()
      ],
    );
  }
}

LineChartBarData get lineChartBarData1_1 => LineChartBarData(
  isCurved: true,
  gradient: LinearGradient(colors: [
    AppColors.primaryColor2.withOpacity(0.5),
    AppColors.primaryColor1.withOpacity(0.5),
  ]),
  barWidth: 4,
  isStrokeCapRound: true,
  dotData: const FlDotData(show: false),
  belowBarData: BarAreaData(show: false),
  spots: const [
    FlSpot(1, 35),
    FlSpot(2, 70),
    FlSpot(3, 40),
    FlSpot(4, 80),
    FlSpot(5, 25),
    FlSpot(6, 70),
    FlSpot(7, 35),
  ],
);

LineChartBarData get lineChartBarData1_2 => LineChartBarData(
  isCurved: true,
  gradient: LinearGradient(colors: [
    AppColors.secondaryColor2.withOpacity(0.5),
    AppColors.secondaryColor1.withOpacity(0.5),
  ]),
  barWidth: 2,
  isStrokeCapRound: true,
  dotData: const FlDotData(show: false),
  belowBarData: BarAreaData(
    show: false,
  ),
  spots: const [
    FlSpot(1, 80),
    FlSpot(2, 50),
    FlSpot(3, 90),
    FlSpot(4, 40),
    FlSpot(5, 80),
    FlSpot(6, 35),
    FlSpot(7, 60),
  ],
);

LineTouchData get lineTouchData1 => LineTouchData(
  handleBuiltInTouches: true,
  touchTooltipData: LineTouchTooltipData(
    tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
  ),
);

List<LineChartBarData> get lineBarsData1 => [
  lineChartBarData1_1,
  lineChartBarData1_2,
];

SideTitles get rightTitles => const SideTitles(
  getTitlesWidget: rightTitleWidgets,
  showTitles: true,
  interval: 20,
  reservedSize: 40,
);

Widget rightTitleWidgets(double value, TitleMeta meta) {
  int value_ = value.toInt();
  return  value_ > 100 ? Container() : Text("${value_.toStringAsFixed(0)}%",
      style: TextStyle(
        color: AppColors.gray,
        fontSize: 12,
      ),
      textAlign: TextAlign.center);
}

SideTitles get bottomTitles => const SideTitles(
  showTitles: true,
  reservedSize: 32,
  interval: 1,
  getTitlesWidget: bottomTitleWidgets,
);

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  var style = TextStyle(
    color: AppColors.gray,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Sun', style: style);
      break;
    case 2:
      text = Text('Mon', style: style);
      break;
    case 3:
      text = Text('Tue', style: style);
      break;
    case 4:
      text = Text('Wed', style: style);
      break;
    case 5:
      text = Text('Thu', style: style);
      break;
    case 6:
      text = Text('Fri', style: style);
      break;
    case 7:
      text = Text('Sat', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}