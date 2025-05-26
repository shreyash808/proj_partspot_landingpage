import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class SubscriptionDialog extends StatelessWidget {
  final String description;
  final String imagePath;
  final String membershipTitle;
  final String plan;
  final String price;
  // final String confirmText;
  // final String cancelText;
  final Color themeColor;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const SubscriptionDialog({
    super.key,
    // required this.title,
    required this.description,
    required this.imagePath,
    required this.membershipTitle,
    required this.plan,
    required this.price,
    // required this.confirmText,
    // required this.cancelText,
    required this.themeColor,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth * 0.95;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: dialogWidth,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              StringConsts.confirmSubs,
              style: AppTextStyles.get20SemiBoldTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.get12RegularTextStyle(
                color: const Color(0xff7A7A7A),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: dialogWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: themeColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    membershipTitle,
                    style: AppTextStyles.get20ExtraBoldTextStyle(
                      color: themeColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plan: $plan",
                          style: AppTextStyles.get12RegularTextStyle(
                            color: themeColor,
                          ),
                        ),
                        Text(
                          "Price: $price",
                          style: AppTextStyles.get12RegularTextStyle(
                            color: themeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            AppButton(
              StringConsts.confirm,
              onPressed: onConfirm,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: AppTextStyles.get14BoldTextStyle(color: Colors.white),
              backgroundColor: themeColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AppOutlinedButton(
                StringConsts.cancel,
                textColor: themeColor,
                height: 50,
                onPressed: onCancel,
                borderColor: themeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
