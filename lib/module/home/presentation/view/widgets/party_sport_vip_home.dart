import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class PartySportVipHome extends StatelessWidget {
  const PartySportVipHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(0.25),
            offset: Offset(2, 2),
            spreadRadius: 0,
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColor.patriarchColor, AppColor.orangeColor],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upgrade to PartyPass VIP",
                    style: AppTextStyles.get20BoldTextStyle(
                      color: AppColor.whiteColor,
                    ),
                  ),
                  Text(
                    "Exclusive benefits & discounts",
                    style: AppTextStyles.get14MediumTextStyle(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoItem(
                    title: "Save up to 20%",
                    subTitle: "On all event bookings & services",
                    iconPath: AppIcons.discountIcon,
                  ),
                  _buildInfoItem(
                    title: "Early Access",
                    subTitle: "Book premium events 24 hours before others.",
                    iconPath: AppIcons.earlyAccessIcon,
                  ),
                ],
              ),
            ),
            AppButton(
              StringConsts.learnMore,
              backgroundColor: AppColor.buttonOrange,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  _buildInfoItem({String? title, String? subTitle, String? iconPath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: CustomSvgPicture(iconPath: iconPath)),
          const SizedBox(width: 6),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: AppTextStyles.get16SemiBoldTextStyle(),
                ),
                Text(
                  subTitle ?? '',
                  style: AppTextStyles.get14RegularTextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
