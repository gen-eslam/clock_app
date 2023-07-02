import 'package:flutter/material.dart';

import '../utils/theme/custom_colors.dart';

class AlarmInfo {
  DateTime alarmDataTime;
  String description;
  bool isActive;
  List<Color> gradientColors;

  AlarmInfo(
      {required this.alarmDataTime, this.description="", this.isActive = false,this.gradientColors = GradientColors.sunset});
}
