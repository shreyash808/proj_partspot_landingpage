import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

import '../../main.dart';
import '../classes/language_controller.dart';
import '../constants/app_enums.dart';


class AppTabBarItem extends StatelessWidget {
  final String title;
  final bool? isSelected;
  final void Function()? onTap;
  final Color? selectedColor;
  final Color? unSelectedColor;

  const AppTabBarItem(
      {super.key, required this.title, this.isSelected = false, this.onTap, this.selectedColor, this.unSelectedColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(title,
              style: isSelected == true
                  ? AppTextStyles.get18BoldTextStyle(color: selectedColor ?? AppColor.purpleColor)

                  : AppTextStyles.get18RegularTextStyle(
                          color: unSelectedColor ?? AppColor.blackColor.withOpacity(0.3))),
          Container(
            height: 3,
            decoration: BoxDecoration(
                color: isSelected == false ? AppColor.transparent : (unSelectedColor ?? AppColor.purpleColor),
                borderRadius: BorderRadius.circular(100)),
            width: 28.spW,
          )
        ],
      ),
    );
  }
}
