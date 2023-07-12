import 'package:clock_app/utils/services/database_helper.dart';
import 'package:get/get.dart';

import '../model/alarm_info.dart';

class AlarmController extends GetxController{

   List<AlarmInfo> _alarmInfo =[];
  List<AlarmInfo> get alarmInfo =>_alarmInfo;

  @override
  void onInit() {
    getAlarms();
    super.onInit();
  }

  void getAlarms()async{
   _alarmInfo= await DatabaseHelper.instance.getAlarms();
   update();
  }

  void insertAlarm(AlarmInfo alarmInfo){
    DatabaseHelper.instance.insertAlarm(alarmInfo);
    getAlarms();
  }
  void deleteAlarm(int id){
    DatabaseHelper.instance.deleteAlarm(id);
    getAlarms();
  }

}