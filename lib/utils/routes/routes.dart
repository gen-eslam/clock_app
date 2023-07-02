import 'package:get/get.dart';

import '../../view/screens/home_screen.dart';


class AppRoutes{

  static const initScreen = Routes.homeScreen;
  static final routes =[
    GetPage(name: Routes.homeScreen, page: ()=>const HomeScreen()),
  ];
}
class Routes{
  static const String homeScreen = "/";
}