import 'package:flutter/material.dart';
import 'package:partyspot/module/party_spot_vip/view/widgets/vip_plan_cards.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/widgets/buttons.dart';


class PlanDetailCard extends StatelessWidget {
  final Color containerColor;
  final String title;
  final String duration;
  final String subtitle;
  final String price;
  final List<String> offers;
  final String buttonText;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  const PlanDetailCard({
    super.key,
    required this.containerColor,
    required this.title,
    required this.duration,
    required this.subtitle,
    required this.price,
    required this.offers,
    required this.buttonText,
    required this.buttonTextColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.get22ExtraBoldTextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: AppTextStyles.get14RegularTextStyle(color: Colors.white),
              ),
              RichText(
                text: TextSpan(
                  text: price,
                  style: AppTextStyles.get40ExtraBoldTextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: '/$duration',
                      style: AppTextStyles.get14BoldTextStyle(),
                    ),
                  ],
                ),
              ), 
              ...offers
                  .map((offer) => buildOfferRow(offer, morepadding: true)),
              AppButton(
                buttonText,
                onPressed: onPressed,
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: AppTextStyles.get14BoldTextStyle(
                  color: buttonTextColor,
                ),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
