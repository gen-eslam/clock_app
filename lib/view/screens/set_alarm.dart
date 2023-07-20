import 'package:clock_app/controllers/set_alarm_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/theme/custom_colors.dart';
import '../widgets/color_picker/color_palette.dart';
import '../widgets/day_picker/day_picker.dart';

class SetAlarm extends GetWidget<SetAlarmController> {
  const SetAlarm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Column(
                  children: [
                    GetBuilder<SetAlarmController>(builder: (logic) {
                      return TextButton(
                        onPressed: () {
                          logic.getTime(context: context);
                        },
                        child: Text(controller.alarmTimeString,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30.sp,
                                letterSpacing: 10.r)),
                      );
                    }),
                    SizedBox(
                      height: 20.r,
                    ),
                    TextField(
                      controller: controller.textController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        hintMaxLines: 1,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 3.r,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      onChanged: (value) {
                        controller.alarmInfo.title = value;
                      },
                    ),
                    const ListTile(
                      title: Text(
                        'Repeat',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                            controller.repeat.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    controller.repeatIndex.value = index;
                                  },
                                  child: Obx(() {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: CustomColors.pageBackgroundColor,
                                        border: Border.all(
                                          color: controller.repeatIndex == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          width: 2.r,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(controller.repeat[index],
                                          style: TextStyle(
                                              color:
                                                  CustomColors.primaryTextColor,
                                              letterSpacing: 2.r,
                                              fontWeight: FontWeight.bold)),
                                    );
                                  }),
                                )),
                      ],
                    ),
                    Obx(() {
                      return Visibility(
                        visible: controller.repeatIndex.value == 3,
                        child: DayPicker(
                          dayInWeek: controller.days,
                        ),
                      );
                    }),
                    const ListTile(
                      title: Text('Color of Alarm Card',
                          style:
                              TextStyle(color: Colors.white, letterSpacing: 2)),
                    ),
                    ColorPalette(alarmInfo: controller.alarmInfo),
                    SizedBox(
                      height: 20.r,
                    ),
                  ],
                )),
            Flexible(
              flex: 2,
              child: FloatingActionButton.extended(
                onPressed: () {
                  controller.setOnceAlarm();
                  Get.back();
                },
                icon: const Icon(Icons.alarm),
                label: const Text(
                  'Save',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
