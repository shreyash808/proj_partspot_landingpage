import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'app_theme.dart';

class DarkTheme implements AppTheme {
  @override
  Color get primaryColor => AppColor.steelPinkColor;

  @override
  Color get backgroundColor => AppColor.whiteColor;

  @override
  Color get textColor => AppColor.blackColor;

  @override
  Color get accentColor => AppColor.purpleDarkColor;

  @override
  ThemeData themeData(BuildContext context) => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: 'BMPlexSans-Regular',
    scaffoldBackgroundColor: AppColor.whiteColor,
    dividerColor: AppColor.whiteColor.withOpacity(0.12),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColor.steelPinkColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent, // Button background color
          foregroundColor: AppColor.whiteColor,
          textStyle: AppTextStyles.get18BoldTextStyle()
      ),
    ),
    appBarTheme: AppBarTheme(
        titleTextStyle: AppTextStyles.get18SemiBoldTextStyle(
            color: AppColor.darkTextColor),
        color: AppColor.whiteColor),
    textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.whiteColor,
        fontFamily: 'IBMPlexSans-Regular',
        decorationColor: AppColor.whiteColor),
  );

  @override
  Color get appThemeGradient1 => AppColor.steelPinkColor;

  @override
  Color get appThemeGradient2 => AppColor.purpleDarkColor;
}
