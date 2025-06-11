import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = AppColor.disableButtonOrange,
    this.height = 60,
    this.borderRadius = 10,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTextStyles.get20MediumTextStyle(color: AppColor.whiteColor),
        ),
      ),
    );
  }
}
