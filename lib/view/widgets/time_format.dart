import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeFormat extends StatelessWidget {
  String dateTime;
  Color color;
  double fontSize;
  FontWeight fontWeight;

  TimeFormat(
      {super.key,
      required this.dateTime,
      this.color = Colors.white,
      required this.fontSize,
        this.fontWeight = FontWeight.bold,
      });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: TextStyle(color: color, fontSize: fontSize.sp,fontWeight: fontWeight),
          text: "${dateTime.split(" ").first} ",
          children: [
            TextSpan(
              text: dateTime.split(" ").last,
              style: TextStyle(color: color, fontSize: fontSize.sp*2/3,fontWeight:fontWeight),
            ),
          ]),
    );
  }
}
