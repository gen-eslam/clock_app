import 'package:clock_app/model/alarm_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/custom_colors.dart';

class AlarmCard extends StatelessWidget {
  final AlarmInfo alarmInfo;

  const AlarmCard({Key? key, required this.alarmInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(bottom: 32.r,end: 20.r),
      padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: GradientTemplate.gradientTemplate[alarmInfo.gradientColors].colors.last.withOpacity(0.4),
            blurRadius: 8.r,
            spreadRadius: 2,
            offset: Offset(4,4),

          ),
        ],
        gradient:  LinearGradient(
          colors: GradientTemplate.gradientTemplate[alarmInfo.gradientColors].colors,
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.label,
                color: Colors.white,
                size: 24.r,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                alarmInfo.title,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Switch(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.white,
              ),
            ],
          ),
          Text(
            'Mon-Fri',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '07:00 AM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(Icons.keyboard_arrow_down,
                  color: Colors.white, size: 30.r),
            ],
          ),
        ],
      ),
    );
  }
}
