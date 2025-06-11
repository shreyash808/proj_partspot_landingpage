import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:partyspot/module/vip_plans/view/widget/faq_card.dart';
import 'package:partyspot/module/vip_plans/view/widget/planDetailCard.dart';
import 'package:partyspot/module/vip_plans/view/widget/vip_header.dart';
import 'package:partyspot/module/vip_plans/view/widget/vip_info_card.dart';
import 'package:partyspot/utils/alert_dialogs/image_popup.dart';
import 'package:partyspot/utils/alert_dialogs/subscription_dialog.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class BeastPlanScreen extends StatelessWidget {
  const BeastPlanScreen({super.key});

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
                      title: StringConsts.joinBeast,
                      subtitle: StringConsts.vipBeastSubscribe,
                    ),

                    PlanDetailCard(
                      containerColor: AppColor.orangeColor,
                      title: StringConsts.beastCaps,
                      subtitle: StringConsts.beastDesc,
                      price: '₹ 199',
                      duration: StringConsts.month,
                      offers: [
                        StringConsts.beast1,
                        StringConsts.beast2,
                        StringConsts.beast3,
                        StringConsts.beast4,
                      ],
                      buttonText: StringConsts.getMonthyPass,
                      buttonTextColor: AppColor.orangeColor,
                      onPressed: () {
                        Get.dialog(
                          SubscriptionDialog(
                            description:
                                "You’re about to subscribe to the Yearly Pass (BEAST) for ₹199.",
                            imagePath: AppImages.beastImage,
                            membershipTitle: StringConsts.beastMembership,
                            plan: StringConsts.monthlyPass,
                            price: "₹199 /${StringConsts.month}",

                            themeColor: AppColor.buttonOrange,
                            onConfirm: () {
                              Get.back();
                              Get.dialog(
                                ImageDialog(
                                  title: StringConsts.vipWelcome,
                                  imagePath: AppImages.orangePopup,
                                  buttonText: StringConsts.done,
                                  onConfirm: () {
                                    Get.back();
                                  },
                                  themeColor: AppColor.buttonOrange,
                                ),
                              );
                            },
                            onCancel: () {
                              Get.back();
                            },
                          ),
                        );
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
