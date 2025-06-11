import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class HostedAndPartnerBy extends StatelessWidget {
  const HostedAndPartnerBy({super.key});

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
          Text(StringConsts.hostedBy,style: AppTextStyles.get20BoldTextStyle()),
          const SizedBox(height: 14),
          _buildAboutItem(text: "The Blue Dot Cafe",desc: "3rd ‘A’ road, near mega mart, Sardarpura, Jodhpur, (Raj.)."),
          const SizedBox(height: 24),
          Text(StringConsts.partneredBy,style: AppTextStyles.get20BoldTextStyle()),
          const SizedBox(height: 14),
          _buildAboutItem(text: "The PartySpot by Partywalah",desc: "www.partywalah.in"),
        ],
      ),
    );
  }

  _buildAboutItem({required String? text,String? desc}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
          height: 48,
            decoration: BoxDecoration(
              color: AppColor.offWhiteColor,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text ?? '',style: AppTextStyles.get14SemiBoldTextStyle()),
              Text(desc ?? '',style: AppTextStyles.get10RegularTextStyle(color: AppColor.darkGreyTextColor),),
            ],
          )),
        ],
      ),
    );
  }
}
