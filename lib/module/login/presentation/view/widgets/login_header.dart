import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';

import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class LoginOtpImageHeader extends StatelessWidget {
  final String imagePath;
  final String text;
  LoginOtpImageHeader({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          CustomImageAsset(image: imagePath, height: 200),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppTextStyles.get24SemiBoldTextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
