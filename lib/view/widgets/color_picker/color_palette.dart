import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/alarm_info.dart';
import '../../../utils/theme/custom_colors.dart';

class ColorPalette extends StatefulWidget {
  AlarmInfo alarmInfo;

  ColorPalette({super.key, required this.alarmInfo});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(GradientTemplate.gradientTemplate.length, (index) =>
            colorButton(index: index,)),
      ],
    );
  }

  Widget colorButton({ required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.alarmInfo.gradientColors = index;
          selectedIndex = index;
        });
      },
      child: Container(
        height: 30.r,
        width: 30.r,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
              color:selectedIndex == index ?Colors.white: Colors.transparent,
            width: 1,
          ),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: GradientTemplate.gradientTemplate[index].colors,
          ),
          borderRadius: BorderRadius.circular(10.r),

        ),

      ),
    );
  }
}
