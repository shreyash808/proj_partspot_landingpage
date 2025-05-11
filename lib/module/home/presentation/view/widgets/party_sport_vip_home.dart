import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class PartySportVipHome extends StatelessWidget {
  const PartySportVipHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.patriarchColor,
                        AppColor.orangeColor,
                      ]
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Upgrade to PartyPass VIP",style: AppTextStyles.get20BoldTextStyle(color: AppColor.whiteColor),),
                      Text("Exclusive benefits & discounts",style: AppTextStyles.get14MediumTextStyle(color: AppColor.whiteColor),)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
