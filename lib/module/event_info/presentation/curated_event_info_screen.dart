import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/back_button.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/counter_widget/app_counter.dart';
import 'package:partyspot/utils/widgets/counter_widget/app_counter_controller.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AppCounterController(lowerLimit: 2, initialValue: 3);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.offWhiteColor,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Stack(
                      // fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          // height: 257.spH,
                          child: CustomImageAsset(
                            fit: BoxFit.fitWidth,
                            image: 'assets/images/jpg/curated_party_dummy_thumnail.jpg',
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: AppBackButton(

                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EDM SUNDAY',style: AppTextStyles.get32BoldTextStyle()),
                            Text('The Blue Dot Cafe',style: AppTextStyles.get14RegularTextStyle()),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month,size: 14,),
                                    const SizedBox(width: 4,),
                                    Text('11 May 2025',style: AppTextStyles.get12RegularTextStyle(color: AppColor.lightGreyTextColor)),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.timelapse_rounded,size: 14,),
                                    const SizedBox(width: 4,),
                                    Text('7 PM onwards',style: AppTextStyles.get12RegularTextStyle(color: AppColor.lightGreyTextColor)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.disableButtonOrange,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                          child: Text('₹499',style: AppTextStyles.get30BoldTextStyle(color: AppColor.whiteColor)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20,left: 16,right: 16),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConsts.aboutEvent,style: AppTextStyles.get20BoldTextStyle()),
                            Row(
                              children: List.generate(5, (index){
                                return Icon(Icons.star_rounded,color: AppColor.yellowVibrantColor);
                              }),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('Join us for an electrifying DJ Party where the beats drop hard and the energy never fades!',style: AppTextStyles.get16RegularTextStyle(),)
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(StringConsts.noOfGuests,style: AppTextStyles.get16BoldTextStyle()),
                              const SizedBox(width: 12),
                              AppCounter(controller: controller, onChanged: (val){})
                            ],
                          ),
                          const SizedBox(height: 6),
                          AppButton(StringConsts.bookNow, onPressed: (){},backgroundColor: AppColor.violet),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
