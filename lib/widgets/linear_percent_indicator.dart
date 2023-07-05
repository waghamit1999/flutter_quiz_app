import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearPercentIndicatorWidget extends StatelessWidget {
  final double indicatorPercent;
  const LinearPercentIndicatorWidget(
      {super.key, required this.indicatorPercent});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: 320.0,
      lineHeight: 14.0,
      percent: indicatorPercent,
      backgroundColor: Colors.blueGrey[50],
      progressColor: Colors.blue,
    );
  }
}
