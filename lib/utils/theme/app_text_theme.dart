import 'package:education_mobile_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const textTheme = TextTheme(
    bodyText1: TextStyle(
      color: AppColor.darkTextColor,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    ),
    bodyText2: TextStyle(
      color: AppColor.backgroundColorW,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    ),
    headline1: TextStyle(
      color: AppColor.darkTextColor,
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: AppColor.primaryColor,
      fontSize: 26,
      fontWeight: FontWeight.w900,
    ),
    headline3: TextStyle(
      color: AppColor.darkTextColor,
      fontSize: 16,
    ),
    headline4: TextStyle(
      fontSize: 14,
    ),
    subtitle1: TextStyle(
      color: AppColor.hintTextColor,
    ),
    subtitle2: TextStyle(
      color: AppColor.primaryColor,
    ),
  );
}
