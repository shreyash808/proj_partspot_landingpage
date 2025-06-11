import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class CircularIconButton extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback? onTap;

  const CircularIconButton({
    super.key,
    this.size = 65,
    this.backgroundColor = AppColor.orangeColor,
    required this.icon,
    this.iconColor = AppColor.whiteColor,
    this.iconSize = 30,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor,

          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: iconColor, size: iconSize)),
      ),
    );
  }
}
