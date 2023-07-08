class ConstanceString{
  static const String appName = "Clock App";


    /// font family todo change it to theme
    static const String fontFamily = "avenir";

    /// home Screen
    static const String clock = "Clock";
    static const String alarm = "Alarm";
    static const String timer = "Timer";
    static const String stopWatch = "Stopwatch";

    /// clock screen
    static const String timeZone = "Timezone";

    ///Alarm screen
    static const String addAlarm = "Add Alarm";



    ///database helper
  static int version = 1;
  static String databaseName = "alarm.db";
  static String tableName = "alarm";
  static String columnId = "id";
  static String columnTitle = "title";
  static String columnDateTime = "alarmDateTime";
  static String columnPending = "isPending";
  static String columnColorIndex = "gradientColorIndex";

}