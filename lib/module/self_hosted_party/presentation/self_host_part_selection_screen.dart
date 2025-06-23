import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/plan_a_wedding/presentation/controller/plan_a_event_controller.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/party_type_selection.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class SelfHostPartSelectionScreen extends StatelessWidget {
  SelfHostPartSelectionScreen({super.key});
  final PlanAEventController planAEventController = Get.find<PlanAEventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhiteColor,
      body: SafeArea(
        top: false,
        child: PartyTypeSelection(
          image: AppImages.selfHostedFeatureImage2,
          title: StringConsts.hostYourPartyWithUs,
          desc: StringConsts.selectTheTypeOfEvent,
          items: planAEventController.subTypes,
          isMultiSelect: false,
          onSelectionDone: (selectedItems) {
            print("Selected items: $selectedItems");
            Get.toNamed(Routes.planEventScreen,arguments: {RoutesArgument.title: "Plan your Birthday Party"});
          },
        )
      ),
    );
  }
}
