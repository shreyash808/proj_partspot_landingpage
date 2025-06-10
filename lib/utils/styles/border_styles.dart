import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class BorderStyles {
  BorderStyles();

  static OutlineInputBorder disableTextFieldBorderStyle({double radius = 12}) => OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        borderSide: const BorderSide(
          color: AppColor.transparent,
          width: 1.0,
        ),
      );

  static OutlineInputBorder focusedTextFieldBorderStyle({double radius = 12}) => OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        borderSide: const BorderSide(
          color: AppColor.transparent,
          width: 1.0,
        ),
      );

  static OutlineInputBorder errorBorder({double radius = 12}) => OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        borderSide: const BorderSide(
          color: AppColor.errorColor,
          width: 0.5,
        ),
      );
}
