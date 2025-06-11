import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class OnboardingDot extends StatelessWidget {
  final bool isActive;

  const OnboardingDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color:
            isActive ? AppColor.disableButtonOrange : AppColor.borderGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
