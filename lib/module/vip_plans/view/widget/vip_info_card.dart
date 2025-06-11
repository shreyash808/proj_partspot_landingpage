import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class InfoCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String description;

  const InfoCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: AppTextStyles.get20BoldTextStyle(
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
              Text(
                description,
                style: AppTextStyles.get14RegularTextStyle(
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
