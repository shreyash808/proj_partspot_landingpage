import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class SelectionItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final double? borderWidth;
  final double? borderRadius;
  final TextStyle? textStyle;
  final BoxConstraints? constraints;

  const SelectionItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.padding,
    this.constraints,
    this.borderWidth,
    this.borderRadius,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: constraints,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: Border.all(
            color: isSelected ? AppColor.orangeColor : AppColor.disabledColor,
            width: borderWidth ?? 2,
          ),
        ),
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.get14SemiBoldTextStyle(
            color: isSelected ? AppColor.orangeColor : AppColor.disabledColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
