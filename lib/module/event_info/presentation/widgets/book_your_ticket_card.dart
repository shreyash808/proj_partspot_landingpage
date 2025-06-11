import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/counter_widget/app_counter.dart';
import 'package:partyspot/utils/widgets/counter_widget/app_counter_controller.dart';

class BookYourTicketCard extends StatelessWidget {
  BookYourTicketCard({super.key});
  final controller = AppCounterController(lowerLimit: 2, initialValue: 3);

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
          Text(StringConsts.bookYourTickets,style: AppTextStyles.get20BoldTextStyle()),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConsts.noOfGuests,style: AppTextStyles.get14SemiBoldTextStyle()),
                    Text(StringConsts.maximumTicketsPerBooking,style: AppTextStyles.get10RegularTextStyle(color: AppColor.darkGreyTextColor),),
                  ],
                )),
                const SizedBox(width: 14),
                AppCounter(controller: controller, onChanged: (val){}),
              ],
            ),
          ),
          Divider(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(StringConsts.totalPrice,style: AppTextStyles.get14SemiBoldTextStyle()),
              Text("₹ 499",style: AppTextStyles.get14SemiBoldTextStyle())
            ],
          )
        ],
      ),
    );

  }
}
