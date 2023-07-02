import 'package:clock_app/utils/bindings/binding.dart';
import 'package:clock_app/utils/constans_string.dart';
import 'package:clock_app/utils/routes/routes.dart';
import 'package:clock_app/utils/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
