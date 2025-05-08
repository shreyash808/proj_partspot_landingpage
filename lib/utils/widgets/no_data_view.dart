import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:partyspot/utils/widgets/text_view.dart';

class NoDataView extends StatelessWidget {
  final String? svgIconPath;
  final String? imagePath;
  final String? text;
  const NoDataView({super.key,this.svgIconPath,this.imagePath,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(svgIconPath?.isNotEmpty ?? false)
            CustomSvgPicture(
              image: svgIconPath,
              width: 80.spW,
            ),
          if(imagePath?.isNotEmpty ?? false)
            CustomImageAsset(
              image: imagePath,
              width: 80.spW,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
            child: TextView(text ?? '',style: AppTextStyles.get12MediumTextStyle(color: AppColor.color909090)),
          )
        ],
      ),
    );
  }
}
