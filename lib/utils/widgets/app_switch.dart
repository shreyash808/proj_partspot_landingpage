import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partyspot/utils/widgets/text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import '../../../../utils/constants/app_size.dart';
import '../../../../utils/constants/color_consts.dart';

class AppSwitch extends StatelessWidget {
  final String? text;
  final bool? switchValue;
  final Function(bool val)? onChanged;
  final String? iconPath;

  const AppSwitch({
    super.key,
    this.text,
    this.switchValue,
    this.onChanged,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.spH),
      child: Row(
        children: [
          if (iconPath != null)
            Padding(
              padding: EdgeInsets.only(right: 15.spW),
              child: Container(
                height: 20.spW,
                width: 20.spW,
                margin: EdgeInsets.symmetric(horizontal: 5.spW),
                child: SvgPicture.asset(
                  iconPath ?? '',
                  colorFilter: const ColorFilter.mode(
                    AppColor.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text ?? '',
                  style: AppTextStyles.get16RegularTextStyle(
                    color: AppColor.blackColor,
                  ),
                ),
                CupertinoSwitch(
                  value: switchValue ?? false,
                  activeColor: AppColor.primaryColor,
                  trackColor: AppColor.disabledBorderColor,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
