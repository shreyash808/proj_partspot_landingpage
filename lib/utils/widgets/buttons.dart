import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final String? desc;
  final Color? color;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final bool isCurve;
  final bool takeFullWidth;
  final bool isEnabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? width;
  final BorderSide? side;
  final TextStyle? textStyle;

  const AppButton(
    this.text, {
    super.key,
    this.margin,
    this.desc,
    this.height,
    this.width,
    this.side,
    this.isEnabled = true,
    this.isCurve = false,
    this.color,
    this.textColor,
    this.backgroundColor,
    this.textStyle,
    required this.onPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.takeFullWidth = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    String title = text;
    Widget? icon = suffixIcon;

    final _text = Text(
      title,
      textAlign: TextAlign.center,
      style:
          textStyle ??
          AppTextStyles.get18SemiBoldTextStyle(
            color: isEnabled && onPressed != null ? null : AppColor.whiteColor,
          ),
    );

    return SizedBox(
      width: width ?? (takeFullWidth ? double.infinity : null),
      height: height,
      child: Container(
        margin: margin,
        decoration:
            isEnabled && onPressed != null
                ? BoxDecoration(
                  color: backgroundColor ?? AppColor.buttonOrange,
                  borderRadius:
                      isCurve
                          ? BorderRadius.all(Radius.circular(40.0))
                          : BorderRadius.all(Radius.circular(8.0)),
                )
                : BoxDecoration(
                  borderRadius:
                      isCurve
                          ? BorderRadius.all(Radius.circular(40.0))
                          : BorderRadius.all(Radius.circular(8.0)),
                  color: AppColor.lightOrangeColor,
                ),
        child: TextButton(
          onPressed: (isEnabled && onPressed != null ? onPressed : null),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: side ?? const BorderSide(color: Colors.transparent),
              borderRadius:
                  isCurve
                      ? BorderRadius.circular(100)
                      : BorderRadius.circular(8),
            ),
            padding:
                padding ??
                const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
          ),
          child:
              icon != null || prefixIcon != null
                  ? Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize:
                          takeFullWidth ? MainAxisSize.max : MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: prefixIcon,
                        ),
                        _text,
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: icon,
                        ),
                      ],
                    ),
                  )
                  : _text,
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final String? desc;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final bool takeFullWidth;
  final bool isEnabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? suffixIcon;
  final double? height;
  final double? width;
  final BorderSide? side;
  final TextStyle? textStyle;
  final double borderWidth;

  const AppOutlinedButton(
    this.text, {
    super.key,
    this.margin,
    this.desc,
    this.height,
    this.width,
    this.side,
    this.isEnabled = true,
    this.color,
    this.borderColor,
    this.borderWidth = 1.5,
    this.textColor,
    this.textStyle,
    required this.onPressed,
    this.suffixIcon,
    this.takeFullWidth = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    String title = text;
    Widget? icon = suffixIcon;

    final _text = Text(
      title,
      textAlign: TextAlign.center,
      style:
          textStyle ??
          AppTextStyles.get18SemiBoldTextStyle(
            color:
                isEnabled && onPressed != null
                    ? AppColor.primaryColor
                    : AppColor.greyColor,
          ),
    );

    return SizedBox(
      width: width ?? (takeFullWidth ? double.infinity : null),
      height: height,
      child: TextButton(
        onPressed: isEnabled && onPressed != null ? onPressed : null,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color:
                  isEnabled && onPressed != null
                      ? (borderColor ?? AppColor.primaryColor)
                      : AppColor.disabledBorderColor,
              width: borderWidth,
            ),
          ),
          backgroundColor: color ?? AppColor.whiteColor,
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
        child:
            icon != null
                ? FittedBox(
                  fit: BoxFit.none,
                  child: Row(
                    mainAxisSize:
                        takeFullWidth ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [icon, const SizedBox(width: 8), _text],
                  ),
                )
                : _text,
      ),
    );
  }
}
