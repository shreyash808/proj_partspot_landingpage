import 'package:flutter/material.dart';
import 'package:partyspot/module/vip_plans/view/widget/faq_card.dart';
import 'package:partyspot/module/vip_plans/view/widget/planDetailCard.dart';
import 'package:partyspot/module/vip_plans/view/widget/vip_header.dart';
import 'package:partyspot/module/vip_plans/view/widget/vip_info_card.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class monsterPlanScreen extends StatelessWidget {
  const monsterPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.deepOrange],
                begin: Alignment.center,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VipHeader(
                      title: StringConsts.joinMonster,
                      subtitle: StringConsts.vipMonsterSubscribe,
                    ),

                    PlanDetailCard(
                      containerColor: AppColor.planBlue,
                      title: StringConsts.monsterCaps,
                      subtitle: StringConsts.beastDesc,
                      price: '₹ 999',
                      duration: StringConsts.year,
                      offers: [
                        StringConsts.monster1,
                        StringConsts.monster2,
                        StringConsts.monster3,
                        StringConsts.monster4,
                        StringConsts.monster5,
                      ],
                      buttonText: StringConsts.getYearlyPass,
                      buttonTextColor: AppColor.bluePurple,
                      onPressed: () {
                        // handle tap
                      },
                    ),

                    InfoCard(
                      backgroundColor: AppColor.planDescBox.withOpacity(0.35),
                      title: StringConsts.whyVip,
                      description: StringConsts.whyVipDesc,
                    ),

                    FaqCard(
                      backgroundColor: AppColor.planDescBox.withOpacity(0.35),
                      title: StringConsts.faq,
                      faqList: [
                        FaqItem(
                          question: "Can I cancel my subscription anytime?",
                          answer:
                              "Yes, you can cancel your subscription at anytime. However, we don’t offer refunds for partially used subscription periods.",
                        ),
                        FaqItem(
                          question: "Is the VIP plan available globally?",
                          answer:
                              "Yes, our VIP plan is available to users worldwide unless restricted by local laws.",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
