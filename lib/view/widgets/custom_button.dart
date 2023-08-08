import 'package:clock_app/controllers/home_page_controller.dart';
import 'package:clock_app/model/menu_info.dart';
import 'package:clock_app/utils/services/notificatio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/theme/custom_colors.dart';

class CustomButton extends GetWidget<HomePageController> {
  MenuInfo menuInfo;
  int index;

  CustomButton({super.key, required this.menuInfo, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (logic) {
      return MaterialButton(
        onPressed: () {
          controller.updateIndex(index);
          NotificationService.listOfSchedule();
        },
        color: controller.currentIndex == index
            ? CustomColors.menuBackgroundColor
            : Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: const Radius.circular(30).r,
              bottomEnd: const Radius.circular(30).r),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16).r,
        child: Column(
          children: [
            Image.asset(
              menuInfo.imageSource,
              width: MediaQuery.of(context).size.width / 10,
              scale: 1.5,
            ),
            SizedBox(
              height: 5.r,
            ),
            Text(menuInfo.title,
                style: const TextStyle(
                    color: CustomColors.primaryTextColor, fontSize: 14)),
          ],
        ),
      );
    });
  }
}
