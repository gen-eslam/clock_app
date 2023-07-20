import 'package:clock_app/controllers/home_page_controller.dart';
import 'package:get/get.dart';

import '../../controllers/alarm_controller.dart';
import '../../controllers/set_alarm_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(), fenix: true);
    Get.lazyPut(() => AlarmController(), fenix: true);
    Get.lazyPut(() => SetAlarmController(), fenix: true);
  }
}
