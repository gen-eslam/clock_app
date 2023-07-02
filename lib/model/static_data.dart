import 'package:clock_app/utils/theme/custom_colors.dart';
import 'package:clock_app/view/screens/pages/clock_page.dart';
import 'package:clock_app/view/screens/pages/stopwatch_page.dart';
import 'package:clock_app/view/screens/pages/timer_page.dart';
import 'package:flutter/material.dart';

import '../utils/constans_string.dart';
import '../view/screens/pages/alarm_page.dart';
import 'alarm_info.dart';
import 'enums.dart';
import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
      menuType: MenuType.clock,
      title: ConstanceString.clock,
      imageSource: ConstanceString.clockImg),
  MenuInfo(
      menuType: MenuType.alarm,
      title: ConstanceString.alarm,
      imageSource: ConstanceString.alarmImg),
  MenuInfo(
      menuType: MenuType.timer,
      title: ConstanceString.timer,
      imageSource: ConstanceString.timerImg),
  MenuInfo(
      menuType: MenuType.stopwatch,
      title: ConstanceString.stopWatch,
      imageSource: ConstanceString.stopWatchImg),
];

List<Widget> pages = const [
  ClockPage(),
  AlarmPage(),
  TimerPage(),
  StopwatchPage()
];

///test data
List<AlarmInfo> alarmInfo = [
   AlarmInfo(alarmDataTime: DateTime.now(),description: "Fares",gradientColors: GradientColors.sunset,isActive: true),
   AlarmInfo(alarmDataTime: DateTime.now(),description: "Fares",gradientColors: GradientColors.fire,isActive: false),
   AlarmInfo(alarmDataTime: DateTime.now(),description: "Fares",gradientColors: GradientColors.sea,isActive: true ),
   AlarmInfo(alarmDataTime: DateTime.now(),description: "Fares",gradientColors: GradientColors.sky,isActive: true),
];
