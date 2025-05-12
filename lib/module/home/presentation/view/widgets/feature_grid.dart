import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart' show AppTextStyles;
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart' show StringConsts;
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringConsts.featured,style: AppTextStyles.get20MediumTextStyle(),),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _featureItem(imagePath: AppImages.curatedPartyFeatureImage,title: 'Curated Parties'),
                  _featureItem(imagePath: AppImages.curatedPartyFeatureImage,title: 'Curated Parties'),
                ],
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _featureItem(imagePath: AppImages.curatedPartyFeatureImage,title: 'Curated Parties'),
                  _featureItem(imagePath: AppImages.curatedPartyFeatureImage,title: 'Curated Parties'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  
  _featureItem({String? imagePath, String? title}){
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomImageAsset(
              image: imagePath,
              width: AppSizes.width * 0.5 - 24,
              height: AppSizes.width * 0.5 - 24,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? '', style: AppTextStyles.get16BoldTextStyle(color: AppColor.whiteColor)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Explore', style: AppTextStyles.get12MediumTextStyle(color: AppColor.whiteColor)),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios_rounded,color: AppColor.whiteColor,size: 12,)
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
