import 'package:clock_app/model/static_data.dart';
import 'package:clock_app/utils/constans_string.dart';
import 'package:clock_app/view/widgets/alarm_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/custom_colors.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
            ConstanceString.alarm,
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
        Expanded(
          flex: 8,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              ...List.generate(alarmInfo.length,
                  (index) => AlarmCard(alarmInfo: alarmInfo[index])),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 32.r, end: 20.r),
                child: GestureDetector(
                  onTap: () {},
                  child: DottedBorder(
                    strokeWidth: 3,
                    color: CustomColors.clockOutline,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20).r,
                    dashPattern: [5, 4],
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8)
                          .r,
                      decoration: BoxDecoration(
                        color: CustomColors.clockBG,
                        borderRadius: BorderRadius.circular(20).r,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ConstanceString.addAlarmImg,
                            scale: 1.5,
                          ),
                          SizedBox(
                            height: 8.r,
                          ),
                          Text("Add Alarm",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
