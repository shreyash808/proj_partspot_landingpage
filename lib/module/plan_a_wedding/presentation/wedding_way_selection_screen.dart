import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/plan_a_wedding/presentation/controller/plan_a_wedding_controller.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/party_type_selection.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class WeddingWaySelectionScreen extends StatelessWidget {
  WeddingWaySelectionScreen({super.key});

  final PlanAWeddingController planAWeddingController = Get.find<PlanAWeddingController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhiteColor,
      body: SafeArea(
          top: false,
          child: PartyTypeSelection(
            image: AppImages.weddingWayFeatureImage,
            title: StringConsts.hostYourPartyWithUs,
            desc: StringConsts.selectTheTypeOfWedding,
            items: planAWeddingController.subTypes,
            isMultiSelect: true,
            onSelectionDone: (selectedItems) {
              print("Selected items: $selectedItems");
              Get.toNamed(Routes.planEventScreen,arguments: {RoutesArgument.title: StringConsts.planYourWedding});
            },
          )
      ),
    );
  }
}
