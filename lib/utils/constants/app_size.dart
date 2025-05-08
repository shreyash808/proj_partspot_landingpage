import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppSizes {

  static double get width => Get.size.width;
  static double get height => Get.size.height;

  static SizedBox heightBox({required double boxHeight}) => SizedBox(
    height: getDynamicHeight(boxHeight)
  );

  static SizedBox widthBox({required double boxWidth}) => SizedBox(
    width: getDynamicWidth(boxWidth)
  );

  static double getDynamicHeight(double boxHeight) => (height / 812) * boxHeight;

  static double getDynamicWidth(double boxWidth) => (width / 375) * boxWidth;

  static double get screenPaddingAll => getDynamicWidth(20);

}

extension DynamicSizeExtension on num {
  double get spH => AppSizes.getDynamicHeight(toDouble());

  double get spW => AppSizes.getDynamicWidth(toDouble());
}
