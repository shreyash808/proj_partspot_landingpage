import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class VipPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> offerTexts;
  final String iconPath;
  final Color backgroundColor;
  final Color borderColor;
  final String planName;
  final VoidCallback onTap;

  const VipPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.offerTexts,
    required this.iconPath,
    required this.backgroundColor,
    required this.borderColor,
    required this.planName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
            border: Border.all(width: 1.5, color: borderColor.withOpacity(0.5)),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.get22BoldTextStyle(color: Colors.white),
              ),
              Text(
                price,
                style: AppTextStyles.get40ExtraBoldTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              ...offerTexts.map((text) => buildOfferRow(text)),

              const Spacer(),
              const Divider(color: Colors.white),
              Text(
                planName,
                style: AppTextStyles.get22ExtraBoldTextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildOfferRow(String text, {bool morepadding = false}) {
  return Padding(
    padding: EdgeInsets.only(bottom: morepadding ? 10 : 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSvgPicture(iconPath: AppIcons.greenCheckIcon),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.get12MediumTextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
