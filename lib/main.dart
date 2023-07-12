
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clock_app/utils/bindings/binding.dart';
import 'package:clock_app/utils/constans/constans_string.dart';
import 'package:clock_app/utils/routes/routes.dart';
import 'package:clock_app/utils/services/database_helper.dart';
import 'package:clock_app/utils/services/loacl_notification.dart';
import 'package:clock_app/utils/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  NotificationService.initializeNotification();
  NotificationService.requestNotificationPermission();
   DatabaseHelper.instance.database;


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: ConstanceString.appName,
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        initialRoute: AppRoutes.initScreen,

        theme: ThemeApp.darkTheme,
        //todo dark theme and theme MODE
        // darkTheme: ThemeApp.,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
