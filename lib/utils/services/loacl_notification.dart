import 'dart:ffi';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {

  static Future<bool> initializeNotification()async{
   return await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'scheduled_notification',
        channelName: 'Scheduled Notification',
        channelDescription: 'Notification channel',
        defaultPrivacy: NotificationPrivacy.Secret,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        playSound: true,


      )

    ]);
  }
  static Future<bool> requestNotificationPermission()async{
     bool isAllowed = await   AwesomeNotifications().isNotificationAllowed();

     if(!isAllowed){
       return await  AwesomeNotifications().requestPermissionToSendNotifications();


     }
     return true;

  }

  static Future<bool> createScheduleNotification() async {
    return await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: Random().nextInt(1000),
            channelKey: "scheduled_notification",
          title: "fares",
          body: "faressssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
          displayOnBackground: true,
          criticalAlert: true,



          wakeUpScreen: true,

        ),
      schedule: NotificationCalendar(
        day: DateTime.now().day,
        second: DateTime.now().second+2,
        hour: DateTime.now().hour,
        month: DateTime.now().month,
        allowWhileIdle: true,


      ),
    );
  }
}
