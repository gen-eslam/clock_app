import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static const String scheduleKey = "scheduled_notification";

  static Future<bool> initializeNotification() async {
    return await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: scheduleKey,
        channelName: 'Scheduled Notification',
        channelDescription: 'Notification channel',
        defaultPrivacy: NotificationPrivacy.Public,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        playSound: true,
        criticalAlerts: true,
      )
    ]);
  }

  static Future<bool> requestNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (!isAllowed) {
      return await AwesomeNotifications()
          .requestPermissionToSendNotifications();
    }
    return true;
  }

  static Future<bool> createScheduleNotification(
      {required int id,
      required String title,
      required String cornExp,
      required DateTime dateTime,
      required DateTime initDate,
      required bool repeat}) async {
    return await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: scheduleKey,
        title: title,
        body: "hello my friend",
        displayOnBackground: true,
        displayOnForeground: true,
        wakeUpScreen: true,
      ),
      schedule: NotificationAndroidCrontab(
          initialDateTime: initDate,
          crontabExpression: cornExp,
          repeats: repeat,
          allowWhileIdle: true),
    );
  }

  static Future<void> listOfSchedule() async {
    List<NotificationModel> list =
        await AwesomeNotifications().listScheduledNotifications();

    print(list);
  }

  static Future<void> closeNotification(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  static Future<void> closeAllNotification() async {
    await AwesomeNotifications().cancelAllSchedules();
  }
}
