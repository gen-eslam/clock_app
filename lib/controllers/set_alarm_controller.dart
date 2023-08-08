import 'package:clock_app/utils/function/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/alarm_info.dart';
import '../model/day_in_week.dart';
import '../utils/services/notificatio_service.dart';
import 'alarm_controller.dart';

class SetAlarmController extends GetxController {
  final List<String> repeat = ["daily", "once", "sun to tue", "custom"];
  final List<String> onceChooseList = ["today", "tomorrow"];
  RxInt onceChoose = 0.obs;
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
  Rx<DateTime> dateValue = DateTime.now().obs;
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
    dateValue.value = DateTime(
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

    NotificationService.createScheduleNotification(
        id: alarmInfo.id!,
        cornExp: cornExp(
            dateTime: alarmInfo.alarmDataTime, index: repeatIndex.value),
        title: alarmInfo.title,
        dateTime: alarmInfo.alarmDataTime,
        initDate: onceChoose.value == 0
            ? DateTime.now()
            : DateTime.now().add(const Duration(days: 1)),
        repeat: false);
    alarmController.getAlarms();
    Get.snackbar(
      "${alarmInfo.alarmDataTime.difference(DateTime.now()).inSeconds}",
      "",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> setDailyAlarm() async {
    alarmInfo.id = await alarmController.insertAlarm(alarmInfo);
    NotificationService.createScheduleNotification(
        id: alarmInfo.id!,
        cornExp: cornExp(
            dateTime: alarmInfo.alarmDataTime, index: repeatIndex.value),
        title: alarmInfo.title,
        dateTime: alarmInfo.alarmDataTime,
        initDate:
            alarmInfo.alarmDataTime.add(const Duration(days: 1, hours: -1)),
        repeat: true);
    alarmController.getAlarms();
    Get.snackbar(
      "${alarmInfo.alarmDataTime.difference(DateTime.now()).inSeconds}",
      "",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> setSunToTueAlarm() async {
    alarmInfo.id = await alarmController.insertAlarm(alarmInfo);
    NotificationService.createScheduleNotification(
        id: alarmInfo.id!,
        cornExp: cornExp(
            dateTime: alarmInfo.alarmDataTime, index: repeatIndex.value),
        title: alarmInfo.title,
        dateTime: alarmInfo.alarmDataTime,
        initDate:
            alarmInfo.alarmDataTime.add(const Duration(days: 1, hours: -1)),
        repeat: true);
    alarmController.getAlarms();
  }

  Future<void> setCustomAlarm() async {
    alarmInfo.id = await alarmController.insertAlarm(alarmInfo);
    NotificationService.createScheduleNotification(
        id: alarmInfo.id!,
        cornExp: cornExp(
            dateTime: alarmInfo.alarmDataTime,
            index: repeatIndex.value,
            custom: customDaysForCorn(days)),
        title: alarmInfo.title,
        dateTime: alarmInfo.alarmDataTime,
        initDate:
            alarmInfo.alarmDataTime.add(const Duration(days: 1, hours: -1)),
        repeat: true);
    alarmController.getAlarms();
    Get.snackbar(
      "${alarmInfo.alarmDataTime.difference(DateTime.now()).inSeconds}",
      "",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
