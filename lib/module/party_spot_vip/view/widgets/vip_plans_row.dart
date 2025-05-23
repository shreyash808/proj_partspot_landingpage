import 'package:flutter/material.dart';
import 'package:partyspot/module/party_spot_vip/view/widgets/vip_plan_cards.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class VipPlansRow extends StatelessWidget {
  const VipPlansRow({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VipPlanCard(
            title: StringConsts.monthly,
            price: "₹ 199",
            offerTexts: [
              StringConsts.monthlyOffer1,
              StringConsts.monthlyOffer2,
            ],
            iconPath: AppIcons.greenCheckIcon,
            backgroundColor: AppColor.buttonOrange,
            borderColor: AppColor.buttonOrange,
            planName: StringConsts.beast,
          ),
          const SizedBox(width: 16),
          VipPlanCard(
            title: StringConsts.annual,
            price: "₹ 999",
            offerTexts: [
              StringConsts.yearlyOffer1,
              StringConsts.yearlyOffer2,
              StringConsts.yearlyOffer3,
            ],
            iconPath: AppIcons.greenCheckIcon,
            backgroundColor: AppColor.planBlue,
            borderColor: AppColor.planBlue,
            planName: StringConsts.monster,
          ),
        ],
      ),
    );
  }
}
