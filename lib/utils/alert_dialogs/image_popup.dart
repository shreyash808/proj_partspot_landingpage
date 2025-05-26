import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class ImageDialog extends StatelessWidget {
  final String buttonText;
  final String title;
  final String imagePath;
  String? outlineText;

  final Color themeColor;

  Color? buttonColor;

  final VoidCallback onConfirm;
  VoidCallback? onCancel;

  ImageDialog({
    super.key,
    required this.title,
    required this.buttonText,
    required this.imagePath,
    this.outlineText,
    this.buttonColor,
    required this.themeColor,
    required this.onConfirm,
    this.onCancel,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: SizedBox(
                height: 100,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),

            Text(
              title,
              style: AppTextStyles.get16BoldTextStyle(color: themeColor),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 18),
            AppButton(
              buttonText,
              isCurve: true,
              onPressed: onConfirm,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: AppTextStyles.get14BoldTextStyle(color: Colors.white),
              backgroundColor: buttonColor ?? themeColor,
            ),
            outlineText != null
                ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AppOutlinedButton(
                    outlineText!,
                    textColor: themeColor,
                    height: 50,
                    onPressed: onCancel,
                    borderColor: themeColor,
                  ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
