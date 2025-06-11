import 'package:flutter/material.dart';
import 'package:partyspot/module/event_info/presentation/widgets/about_event_card.dart';
import 'package:partyspot/module/event_info/presentation/widgets/book_your_ticket_card.dart';
import 'package:partyspot/module/event_info/presentation/widgets/entry_requirement_card.dart';
import 'package:partyspot/module/event_info/presentation/widgets/hosted_and_partner_by.dart';
import 'package:partyspot/module/event_info/presentation/widgets/whats_inclined_card.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/back_button.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgVioletColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
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
                          height: 375.spH,
                          child: CustomImageAsset(
                            fit: BoxFit.cover,
                            image: 'assets/images/jpg/curated_party_dummy_thumnail.jpg',
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: AppBackButton(
          
                          ),
                        ),
                        Positioned(
                          bottom: 22,
                          left: 24,
                          right: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('EDM SUNDAY',style: AppTextStyles.get32BoldTextStyle(color: AppColor.whiteColor)),
                                    Text('An exclusive nightclub takeover for you.',style: AppTextStyles.get14RegularTextStyle(color: AppColor.whiteColor)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
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
                ],
              ),
              const SizedBox(height: 6),
              AboutEventCard(),
              WhatsInclinedCard(),
              EntryRequirementCard(),
              HostedAndPartnerBy(),
              BookYourTicketCard(),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButton(StringConsts.bookNow, onPressed: (){},backgroundColor: AppColor.violet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
