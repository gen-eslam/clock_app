import 'package:clock_app/view/widgets/day_picker/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/day_in_week.dart';

class DayPicker extends StatefulWidget {
  List<DayInWeek> dayInWeek;

  DayPicker({Key? key, required this.dayInWeek}) : super(key: key);

  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.r, horizontal: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.dayInWeek.length,
            (index) => Day(dayInWeek: widget.dayInWeek[index])),
      ),
    );
  }
}
