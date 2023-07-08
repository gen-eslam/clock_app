import 'dart:async';


import 'package:get/get.dart';
import 'package:intl/intl.dart';



class HomePageController extends GetxController {
  RxString formattedTime = DateFormat.jm().format(DateTime.now()).obs;
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
          DateFormat.jm().format(DateTime.now()).toString();
    });
  }

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }



}
