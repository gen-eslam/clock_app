import 'package:flutter/material.dart';

import '../utils/constans/constans_string.dart';
import '../utils/theme/custom_colors.dart';

class AlarmInfo {
  int? id;
  DateTime alarmDataTime;
  String title;
  bool isPending;
  int gradientColors;

  AlarmInfo(
      {this.id,
      required this.alarmDataTime,
      required this.title,
      this.isPending = false,
      this.gradientColors = 0});

  factory AlarmInfo.fromJson(Map<String, dynamic> json) => AlarmInfo(
        alarmDataTime: DateTime.parse(json[ConstanceString.columnDateTime]),
        title: json[ConstanceString.columnTitle],
        id: json[ConstanceString.columnId],
        gradientColors: json[ConstanceString.columnColorIndex] ,
        isPending: json[ConstanceString.columnPending] ==0? false:true,
      );

  toJson() {
    return {
      ConstanceString.columnId: id,
      ConstanceString.columnTitle: title,
      ConstanceString.columnDateTime: alarmDataTime.toString(),
      ConstanceString.columnPending: isPending,
      ConstanceString.columnColorIndex: gradientColors,
    };
  }
}
