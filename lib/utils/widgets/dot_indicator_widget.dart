import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int itemCount;
  final int selectedIndex;
  final double dotSize;
  final double spacing;
  final Color activeColor;
  final bool showOnlyLength;
  final Color inactiveColor;

  const DotIndicator({
    Key? key,
    required this.itemCount,
    required this.selectedIndex,
    this.dotSize = 6.0,
    this.spacing = 3.0,
    this.showOnlyLength = false,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showOnlyLength) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(itemCount, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: activeColor,
              shape: BoxShape.circle,
            ),
          );
        }),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: index == selectedIndex ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
