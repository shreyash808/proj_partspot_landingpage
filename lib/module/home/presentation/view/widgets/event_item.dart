import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart' show AppImages;
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class EventItem extends StatelessWidget {
  final Function()? onTap;
  const EventItem({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 144,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomImageAsset(
                  fit: BoxFit.fitWidth,
                  image: AppImages.popularEventImage1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EDM SUNDAY",
                            style: AppTextStyles.get16BoldTextStyle(
                              color: AppColor.whiteColor,
                            ),
                          ),
                          Text(
                            "The Blue Dot Cafe",
                            style: AppTextStyles.get12MediumTextStyle(
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "See more >",
                          style: AppTextStyles.get12MediumTextStyle(
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
