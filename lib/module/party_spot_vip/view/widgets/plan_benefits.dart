import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:partyspot/module/party_spot_vip/view/widgets/vip_benefit_row.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class PlanBenefits extends StatelessWidget {
  const PlanBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            StringConsts.vipBenfits,
            textAlign: TextAlign.left,
            style: AppTextStyles.get24BoldTextStyle(color: AppColor.vipYellow),
          ),
        ),
        VipOfferRow(
          title: StringConsts.exclusiveDiscount,
          subtitle: StringConsts.discountDescription,
        ),
        VipOfferRow(
          title: StringConsts.vipAccess,
          subtitle: StringConsts.vipAccessDescription,
        ),
        VipOfferRow(
          title: StringConsts.freeVoucher,
          subtitle: StringConsts.freeVoucherDescription,
        ),
        VipOfferRow(
          title: StringConsts.prioritySupport,
          subtitle: StringConsts.prioritySupportDescription,
        ),
      ],
    );
  }

  Widget VipOfferRow({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppIcons.yellowCheckIcon, height: 24, width: 24),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.get16BoldTextStyle(
                    color: AppColor.whiteColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTextStyles.get14LightTextStyle(
                    color: AppColor.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
