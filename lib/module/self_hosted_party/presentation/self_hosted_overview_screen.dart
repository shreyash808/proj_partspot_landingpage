import 'package:flutter/material.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/party_overview.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class SelfHostedOverviewScreen extends StatelessWidget {
  const SelfHostedOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.offWhiteColor,
        body: PartyOverview(
          title: StringConsts.selfHostedParties,
          desc: StringConsts.selfHostedPartiesDesc,
          image: AppImages.selfHostedOverviewImage,
        ),
      ),
    );
  }
}
