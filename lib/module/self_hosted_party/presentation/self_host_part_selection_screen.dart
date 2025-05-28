import 'package:flutter/material.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/party_type_selection.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class SelfHostPartSelectionScreen extends StatelessWidget {
  const SelfHostPartSelectionScreen({super.key});

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
          items: ["Birthday", "Anniversary", "Corporate Event", "Baby Shower"],
          isMultiSelect: false,
          onSelectionDone: (selectedItems) {
            print("Selected items: $selectedItems");
          },
        )
      ),
    );
  }
}
