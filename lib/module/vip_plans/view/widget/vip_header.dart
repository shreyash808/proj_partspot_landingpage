import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class VipHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const VipHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back, color: AppColor.whiteColor),
              ),
              const Spacer(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.get24BoldTextStyle(
                  color: AppColor.whiteColor,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.get16RegularTextStyle(
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
