import 'dart:async';

import 'package:clock_app/model/enums.dart';
import 'package:clock_app/utils/constans_string.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/menu_info.dart';
import '../model/static_data.dart';

class HomePageController extends GetxController {
  RxString formattedTime = DateFormat("hh:mm").format(DateTime.now()).obs;
  RxString formattedDate = DateFormat("EEE, d MMM").format(DateTime.now()).obs;
  String timeZoneString =
      DateTime.now().timeZoneOffset.toString().split('.').first;
  String offsetSign = '';
  int currentIndex = 0;
  // late MenuInfo currentMenuInfo = menuItems[0];

  @override
  void onInit() {
    updateTime();
    changeOffsetSign();
    super.onInit();
  }

  void changeOffsetSign() {
    if (!timeZoneString.startsWith("-")) {
      offsetSign = "+";
    }
  }

  void updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      formattedTime.value =
          DateFormat("hh:mm").format(DateTime.now()).toString();
    });
  }
  void updateIndex(int index){
    currentIndex = index;
    update();
  }

}
