import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class CircularButton extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Function()? onTap;

  const CircularButton({super.key, this.icon, this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                AppColor.purpleDarkColor,
                AppColor.steelPinkColor,
              ])),
          child: Icon(
            icon,
            color: AppColor.whiteColor,
            size: size ?? 24.spW,
          ),
        ),
      ),
    );
  }
}

class OutlinedCircularButton extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? size;
  final Function()? onTap;

  const OutlinedCircularButton({super.key, this.child, this.color, this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all((size ?? 14.spW) / 1.5),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color ?? AppColor.whiteColor,width: 0.5)),
        child: child,
      ),
    );
  }
}

class OutlinedCircularIconButton extends StatelessWidget {
  final Icon? icon;
  final Color? borderColor;
  final double? padding;
  final Function()? onTap;

  const OutlinedCircularIconButton({super.key, this.icon, this.borderColor, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding ?? 10.spW),
        decoration:
            BoxDecoration(shape: BoxShape.circle, border: Border.all(color: borderColor ?? AppColor.whiteColor)),
        child: icon,
      ),
    );
  }
}
