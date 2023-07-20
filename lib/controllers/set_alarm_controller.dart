import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/alarm_info.dart';
import '../model/day_in_week.dart';
import '../utils/services/notificatio_service.dart';
import 'alarm_controller.dart';

class SetAlarmController extends GetxController {
  final List<String> repeat = ["daily", "once", "sun to tue", "custom"];
  final List<DayInWeek> _days = [
    DayInWeek(day: "Sat", index: 6),
    DayInWeek(day: "Sun", index: 7),
    DayInWeek(day: "Mon", index: 1),
    DayInWeek(day: "Tue", index: 2),
    DayInWeek(day: "Wed", index: 3),
    DayInWeek(day: "Thu", index: 4),
    DayInWeek(day: "Fri", index: 5),
  ];

  List<DayInWeek> get days => _days;
  var alarmController = Get.find<AlarmController>();
  RxInt repeatIndex = 0.obs;
  final bool isRepeatSelected = false;
  late String alarmTimeString;
  late AlarmInfo alarmInfo;
  final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    alarmTimeString = DateFormat.jm().format(DateTime.now());
    alarmInfo = AlarmInfo(
      alarmDataTime: DateTime.now(),
      title: "title",
    );
    super.onInit();
  }

  Future<void> getTime({required BuildContext context}) async {
    TimeOfDay timeOfDay =
        (await showTimePicker(context: context, initialTime: TimeOfDay.now()))!;
    alarmTimeString = DateFormat.jm().format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        timeOfDay.hour,
        timeOfDay.minute,
      ),
    );
    alarmInfo.alarmDataTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    update();
  }

  Future<void> setOnceAlarm() async {
    alarmInfo.id = await alarmController.insertAlarm(alarmInfo);

    NotificationService.createScheduleNotificationOnce(
        id: alarmInfo.id!,
        title: alarmInfo.title,
        dateTime: alarmInfo.alarmDataTime,
        repeat: false);
    alarmController.getAlarms();
  }
}
