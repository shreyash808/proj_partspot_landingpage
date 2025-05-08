import 'package:flutter/material.dart';

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
    this.backgroundColor = Colors.deepOrangeAccent,
    required this.icon,
    this.iconColor = Colors.white,
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
