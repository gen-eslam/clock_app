import 'package:clock_app/model/alarm_info.dart';
import 'package:clock_app/view/widgets/time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/alarm_controller.dart';
import '../../utils/theme/custom_colors.dart';

class AlarmCard extends GetView<AlarmController> {
  final AlarmInfo alarmInfo;

  const AlarmCard({Key? key, required this.alarmInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(bottom: 32.r, end: 20.r),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: GradientTemplate
                .gradientTemplate[alarmInfo.gradientColors].colors.last
                .withOpacity(0.4),
            blurRadius: 8.r,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        gradient: LinearGradient(
          colors: GradientTemplate
              .gradientTemplate[alarmInfo.gradientColors].colors,
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
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Switch(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.white,
              ),
            ],
          ),
          const Text(
            'Mon-Fri',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeFormat(
                dateTime:
                    DateFormat.jm().format(alarmInfo.alarmDataTime).toString(),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              GestureDetector(
                onTap: () {
                  controller.deleteAlarm(alarmInfo.id!);
                },
                child:
                    Icon(Icons.delete_forever, color: Colors.white, size: 30.r),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
