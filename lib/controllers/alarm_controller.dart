import 'package:clock_app/utils/services/database_helper.dart';
import 'package:clock_app/utils/services/notificatio_service.dart';
import 'package:get/get.dart';

import '../model/alarm_info.dart';

class AlarmController extends GetxController {
  List<AlarmInfo> _alarmInfo = [];

  List<AlarmInfo> get alarmInfo => _alarmInfo;

  @override
  void onInit() {
    getAlarms();
    super.onInit();
  }

  void closeSchedule(AlarmInfo alarmInfo) {
    if (alarmInfo.isRepeating) {
      alarmInfo.isRepeating = false;
      NotificationService.closeNotification(alarmInfo.id!);
      DatabaseHelper.instance.updateAlarm(alarmInfo);
    } else {
      alarmInfo.isRepeating = true;
      // NotificationService.createScheduleNotification(
      //   id: alarmInfo.id,
      //
      // );
      DatabaseHelper.instance.updateAlarm(alarmInfo);
    }
    getAlarms();
  }

  void getAlarms() async {
    _alarmInfo = await DatabaseHelper.instance.getAlarms();
    update();
  }

  Future<int?> insertAlarm(AlarmInfo alarmInfo) async {
    return await DatabaseHelper.instance.insertAlarm(alarmInfo);
  }

  void deleteAlarm(int id) {
    DatabaseHelper.instance.deleteAlarm(id);
    getAlarms();
  }
}
