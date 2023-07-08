import 'package:clock_app/utils/constans/constans_string.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class ThemeApp{

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: CustomColors.pageBackgroundColor,
    fontFamily: ConstanceString.fontFamily,

  );
}