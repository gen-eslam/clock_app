import 'package:clock_app/view/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_page_controller.dart';
import '../../model/static_data.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends GetWidget<HomePageController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  menuItems.length,
                      (index) =>
                      CustomButton(
                        menuInfo: menuItems[index],
                        index: index,
                      ),),
              ],
            ),
            VerticalDivider(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            Expanded(
              child: GetBuilder<HomePageController>(builder: (logic) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ).r,
                  child: pages[controller.currentIndex],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
