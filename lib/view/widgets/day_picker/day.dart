import 'package:clock_app/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/custom_colors.dart';

class Day extends StatefulWidget {
  DayInWeek dayInWeek;

  Day({Key? key, required this.dayInWeek}) : super(key: key);

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.dayInWeek.isSelected = !widget.dayInWeek.isSelected;
        });
      },
      child: CircleAvatar(
        radius: 22.r,
        backgroundColor: widget.dayInWeek.isSelected
            ? CustomColors.minHandStatColor
            : CustomColors.clockBG,
        child: Text(widget.dayInWeek.day,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              letterSpacing: 2.r,
            )),
      ),
    );
  }
}
