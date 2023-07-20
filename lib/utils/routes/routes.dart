import 'package:clock_app/view/screens/set_alarm.dart';
import 'package:get/get.dart';

import '../../view/screens/home_screen.dart';


class AppRoutes{

  static const initScreen = Routes.homeScreen;
  static final routes =[
    GetPage(name: Routes.homeScreen, page: ()=>const HomeScreen()),
    GetPage(name: Routes.setAlarm, page: ()=> const SetAlarm()),
  ];
}
class Routes{
  static const String homeScreen = "/";
  static const String setAlarm = "/SetAlarm";
}