import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class EntryRequirementCard extends StatelessWidget {
  const EntryRequirementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.whiteColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringConsts.aboutEvent,style: AppTextStyles.get20BoldTextStyle()),
          const SizedBox(height: 10),
          Text(StringConsts.costumeCode,style: AppTextStyles.get14SemiBoldTextStyle()),
          const SizedBox(height: 8),
          Text('Smart Casual - No shorts or Flip-Flops allowed.',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor,)),
          const SizedBox(height: 14),
          Text('Party Rules',style: AppTextStyles.get14SemiBoldTextStyle(color: AppColor.darkGreyTextColor,)),
          const SizedBox(height: 4,),
          _buildAboutItem(text: "Age 21+ only, valid ID required"),
          _buildAboutItem(text: "Tickets are non-refundable"),
          _buildAboutItem(text: "No outside food or beverage allowed."),
        ],
      ),
    );
  }

  _buildAboutItem({required String? text,}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomSvgPicture(iconPath: AppIcons.infoIcon,width: 21,height: 21),
          const SizedBox(width: 14),
          Expanded(child: Text(text ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor),)),
        ],
      ),
    );
  }
}
