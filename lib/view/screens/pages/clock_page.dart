import 'package:clock_app/controllers/home_page_controller.dart';
import 'package:clock_app/utils/constans/constans_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/clock_view.dart';
import '../../widgets/time_format.dart';

class ClockPage extends GetWidget<HomePageController> {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
            ConstanceString.clock,
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                    () =>TimeFormat(dateTime: controller.formattedTime.value,fontSize: 64,fontWeight: FontWeight.normal),
              ),
              Obx(
                    () =>
                    Text(
                      controller.formattedDate.value,
                      style: TextStyle(
                          color: Colors.white, fontSize: 18.sp),
                    ),
              ),
            ],
          ),
        ),
        Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: ClockView(
                size: MediaQuery
                    .of(context)
                    .size
                    .width / 2)),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstanceString.timeZone,
                style:
                TextStyle(color: Colors.white, fontSize: 24.sp),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10).r,
                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16.r,
                    ),
                    Text(
                      "UTC ${controller.offsetSign} ${controller
                          .timeZoneString}",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.white.withOpacity(0.2),
        ),
      ],
    );
  }
}
