import 'package:clock_app/view/screens/pages/clock_page.dart';
import 'package:clock_app/view/screens/pages/stopwatch_page.dart';
import 'package:clock_app/view/screens/pages/timer_page.dart';
import 'package:flutter/material.dart';

import '../utils/constans/constance_image.dart';
import '../utils/constans/constans_string.dart';
import '../view/screens/pages/alarm_page.dart';
import 'alarm_info.dart';
import 'enums.dart';
import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
      menuType: MenuType.clock,
      title: ConstanceString.clock,
      imageSource: ConstanceImage.clockImg),
  MenuInfo(
      menuType: MenuType.alarm,
      title: ConstanceString.alarm,
      imageSource: ConstanceImage.alarmImg),
  MenuInfo(
      menuType: MenuType.timer,
      title: ConstanceString.timer,
      imageSource: ConstanceImage.timerImg),
  MenuInfo(
      menuType: MenuType.stopwatch,
      title: ConstanceString.stopWatch,
      imageSource: ConstanceImage.stopWatchImg),
];

List<Widget> pages = const [
  ClockPage(),
  AlarmPage(),
  TimerPage(),
  StopwatchPage()
];

///test data
List<AlarmInfo> alarmInfo = [
   AlarmInfo(title: "fares",alarmDataTime: DateTime.now(),gradientColors: 0,isPending: true),
   AlarmInfo(title: "fares",alarmDataTime: DateTime.now(),gradientColors:1,isPending: false),
   AlarmInfo(title: "fares",alarmDataTime: DateTime.now(),gradientColors: 2,isPending: true ),
   AlarmInfo(title: "fares",alarmDataTime: DateTime.now(),gradientColors: 0,isPending: true),
];
