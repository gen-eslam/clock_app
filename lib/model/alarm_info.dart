import '../utils/constans/constans_string.dart';

class AlarmInfo {
  int? id;
  DateTime alarmDataTime;
  String title;
  bool isRepeating;
  int gradientColors;

  AlarmInfo(
      {this.id,
      required this.alarmDataTime,
      required this.title,
      this.isRepeating = false,
      this.gradientColors = 0});

  factory AlarmInfo.fromJson(Map<String, dynamic> json) => AlarmInfo(
        alarmDataTime: DateTime.parse(json[ConstanceString.columnDateTime]),
        title: json[ConstanceString.columnTitle],
        id: json[ConstanceString.columnId],
        gradientColors: json[ConstanceString.columnColorIndex],
        isRepeating: json[ConstanceString.columnRepeat] == 0 ? false : true,
      );

  toJson() {
    return {
      ConstanceString.columnId: id,
      ConstanceString.columnTitle: title,
      ConstanceString.columnDateTime: alarmDataTime.toString(),
      ConstanceString.columnRepeat: isRepeating ? 1 : 0,
      ConstanceString.columnColorIndex: gradientColors,
    };
  }
}
