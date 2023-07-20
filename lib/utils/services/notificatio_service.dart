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
        onlyAlertOnce: true,
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

  static Future<bool> createScheduleNotificationOnce(
      {required int id,
      required String title,
      required DateTime dateTime,
      required bool repeat}) async {
    return await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: scheduleKey,
        title: title,
        body: dateTime.toString(),
        displayOnBackground: true,
        criticalAlert: true,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: dateTime.hour,
        minute: dateTime.minute,
        day: dateTime.day,
      ),
    );
  }

  static Future<List<NotificationModel>> listOfSchedule() async {
    return await AwesomeNotifications().listScheduledNotifications();
  }

  static Future<void> closeNotification(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  static Future<void> closeAllNotification() async {
    await AwesomeNotifications().cancelAllSchedules();
  }
}
