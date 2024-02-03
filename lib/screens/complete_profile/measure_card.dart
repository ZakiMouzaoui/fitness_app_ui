import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class MeasureCard extends StatelessWidget {
  const MeasureCard({super.key, required this.measure});

  final String measure;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: size.width*0.03),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors.secondaryG
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(measure, style: const TextStyle(
          color: Colors.white,
        fontSize: 12
      ),),
    );
  }
}
