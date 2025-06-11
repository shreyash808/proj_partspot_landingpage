import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class AboutEventCard extends StatelessWidget {
  const AboutEventCard({super.key});

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
          _buildAboutItem(text: "The Blue Dot Cafe",iconPath: AppIcons.locationIcon),
          _buildAboutItem(text: "24 June 2025, 9:00 pm onwards",iconPath: AppIcons.eventCalendarIcon),
          _buildAboutItem(text: "Up to 200 guests",iconPath: AppIcons.guestIcon),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: List.generate(3, (index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.violet.withOpacity(0.2)
                ),
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: Text("DJ Party",style: AppTextStyles.get12MediumTextStyle(color: AppColor.violet),),
              );
            }),
          )
        ],
      ),
    );
  }

  _buildAboutItem({String? text,String? iconPath}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomSvgPicture(iconPath: iconPath,width: 21,height: 21),
          const SizedBox(width: 14),
          Expanded(child: Text(text ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor),)),
        ],
      ),
    );
  }
}
