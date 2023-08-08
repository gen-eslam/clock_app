import '../../model/day_in_week.dart';

String cornExp(
    {required DateTime dateTime, required int index, String? custom}) {
  switch (index) {
    case 0:
      return "0 ${dateTime.minute} ${dateTime.hour} ? * *";
    case 1:
      return "0 ${dateTime.minute} ${dateTime.hour} ? * *";
    case 2:
      return "0 ${dateTime.minute} ${dateTime.hour} ? * 1,2,3,4,7";
    default:
      return "0 ${dateTime.minute} ${dateTime.hour} ? * $custom";
  }
}

String customDaysForCorn(List<DayInWeek> days) {
  String res = "";
  for (int index = 0; index < days.length; index++) {
    if (days[index].isSelected) {
      if (index != days.length - 1) {
        res += "${days[index].index},";
      } else {
        res += "${days[index].index}";
      }
    }
  }
  return res;
}
