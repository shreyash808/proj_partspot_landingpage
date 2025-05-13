import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyles {
  static const double _px8 = 8.0;
  static const double _px10 = 10.0;
  static const double _px12 = 12.0;
  static const double _px13 = 13.0;
  static const double _px14 = 14.0;
  static const double _px15 = 15.0;
  static const double _px16 = 16.0;
  static const double _px18 = 18.0;
  static const double _px20 = 20.0;
  static const double _px22 = 22.0;
  static const double _px24 = 24.0;
  static const double _px26 = 26.0;
  static const double _px32 = 32.0;
  static const double _px36 = 36.0;
  static const double _px28 = 28.0;

  /// Light -> 300W
  /// Regular -> 400W
  /// Medium -> 500W
  /// Semi-Bold -> 600W
  /// Bold -> 700W

  static const String _light = 'Bold';
  static const String _bold = 'Bold';

  static const String _extraBold = 'ExtraBold';
  static const String _medium = 'Medium';
  static const String _regular = 'Regular';
  static const String _semiBold = 'SemiBold';

  static TextStyle get10LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px10,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get10RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px10,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get10MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px10,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get10SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px10,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get10BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px10,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get12LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px12,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get12RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px12,
      fontFamily: _regular,
      decorationColor: color,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get8RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px8,
      fontFamily: _regular,
      decorationColor: color,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get8MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px8,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
      decorationColor: decorationColor,
    );
  }

  static TextStyle get12MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px12,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
      decorationColor: decorationColor,
    );
  }

  static TextStyle get12SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px12,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get12BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px12,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get13LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px13,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get13RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px13,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get13MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px13,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get13SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px13,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get13BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px13,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get14LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px14,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get14RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px14,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get14MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px14,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get14SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px14,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get14BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px14,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get15LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px15,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get15RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px15,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get15MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px15,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get15SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px15,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get15BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px15,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get16LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px16,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get16RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px16,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get16MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px16,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
      decorationColor: decorationColor,
    );
  }

  static TextStyle get16SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px16,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get16BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px16,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get18LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px18,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get18RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px18,
      fontFamily: _regular,
      fontStyle: fontStyle,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get18MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px18,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get18SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px18,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get18BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px18,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get20LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px20,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get20RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px20,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get20MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px20,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get20SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px20,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get20BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px20,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get22LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px22,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get22RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px22,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get22MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px22,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get22SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px22,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get22BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px22,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get24LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px24,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get24RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px24,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get24MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px24,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get24SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px24,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get24BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px24,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get26LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px26,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get26RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px26,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get26MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px26,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get26SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px26,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get26BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px26,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get28LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px28,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get28RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px28,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get28MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px28,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get28SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px28,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get28BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px28,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get34LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get34RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get34MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get34SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get32BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px32,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get32LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px32,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get32RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px32,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get32MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px32,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get32SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px32,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get34BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get36LightTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _light,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get36RegularTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _regular,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get36MediumTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _medium,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get36SemiBoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _semiBold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextStyle get36BoldTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: _px36,
      fontFamily: _bold,
      decoration: _getDecoration(decoration),
    );
  }

  static TextDecoration? _getDecoration(TextDecoration? decoration) {
    if (decoration == TextDecoration.underline) {
      if (Get.locale?.languageCode == 'ar') {
        return TextDecoration.none;
      } else {
        return TextDecoration.underline;
      }
    } else {
      return decoration;
    }
  }
}
