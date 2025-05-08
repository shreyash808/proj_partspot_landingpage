import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const AppCheckBox({
    super.key,
    this.value = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value); // Toggle the checkbox state
        }
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? AppColor.primaryColor : AppColor.transparent,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1,
          ),
        ),
        child: Icon(
          Icons.check_rounded,
          size: 15,
          color: value ? AppColor.whiteColor : AppColor.transparent,
        ),
      ),
    );
  }
}
