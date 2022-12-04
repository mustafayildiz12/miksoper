import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeStyles {
  static ThemeData themeData(BuildContext context) {
    final MyColors colors = MyColors();
    return ThemeData(
        primaryColor: colors.colorAccentDark,
        shadowColor: colors.colorTextTitleDark,
        hoverColor: colors.colorAccent,
        indicatorColor: colors.colorAccentLight,
        focusColor: colors.bluegrey_400,
        cardColor: colors.colorTextBodyLightThin,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: colors.colorPrimary,
              fontSize: 20.sp),
          elevation: 0,
          backgroundColor: colors.colorAccentDark,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: colors.grey_90,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              color: colors.grey_40,
              fontSize: 22.sp),
          titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              color: colors.grey_40,
              fontSize: 20.sp),
          bodyLarge: TextStyle(color: colors.grey_80, fontSize: 18.sp),
          bodyMedium: TextStyle(color: colors.grey_80, fontSize: 16.sp),
          bodySmall: TextStyle(color: colors.grey_40, fontSize: 14.sp),
        ));
  }
}
