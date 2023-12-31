import 'package:clock_app/utils/constans/constans_string.dart';
import 'package:clock_app/utils/routes/routes.dart';
import 'package:clock_app/view/widgets/alarm_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/alarm_controller.dart';
import '../../../utils/constans/constance_image.dart';
import '../../../utils/theme/custom_colors.dart';

class AlarmPage extends GetWidget<AlarmController> {
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
            physics: const BouncingScrollPhysics(),
            children: [
              GetBuilder<AlarmController>(builder: (logic) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: logic.alarmInfo.length,
                  itemBuilder: (context, index) =>
                      AlarmCard(alarmInfo: logic.alarmInfo[index]),
                );
              }),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 32.r, end: 20.r),
                child: GestureDetector(
                  onTap: () {
                    //todo navigation
                    Get.toNamed(Routes.setAlarm);
                  },
                  child: DottedBorder(
                    strokeWidth: 3,
                    color: CustomColors.clockOutline,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20).r,
                    dashPattern: const [5, 4],
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
                            ConstanceImage.addAlarmImg,
                            scale: 1.5,
                          ),
                          SizedBox(
                            height: 8.r,
                          ),
                          const Text(ConstanceString.addAlarm,
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
        // Expanded(
        //   flex: 8,
        //   child: ListView(
        //     shrinkWrap: true,
        //     physics: const BouncingScrollPhysics(),
        //     children: [
        //       ...List.generate(alarmInfo.length,
        //           (index) => AlarmCard(alarmInfo: controller.alarmInfo[index])),
        //
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
