import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/party_overview.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class PlanAWeddingOverviewScreen extends StatelessWidget {
  const PlanAWeddingOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.offWhiteColor,
        body: PartyOverview(
          title: StringConsts.planAWedding,
          desc: StringConsts.planAWeddingDesc,
          image: AppImages.planAWeddingOverviewImage,
          onNext: (){
            Get.toNamed(Routes.weddingWaySelectionScreen);
          },
        ),
      ),
    );
  }
}
