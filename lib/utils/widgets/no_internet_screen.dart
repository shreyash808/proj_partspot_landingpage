import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/text_view.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback? onRetry;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? subTitleColor;
  final Color? iconColor;

  const NoInternetScreen({
    super.key,
    this.onRetry,
    this.backgroundColor,
    this.titleColor,
    this.subTitleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? AppColor.blackColor.withOpacity(0.8),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 100.spH,
            color: iconColor ?? AppColor.silverColor,
          ),
          AppSizes.heightBox(boxHeight: 20),
          TextView(
            "No Internet Connection",
            style: AppTextStyles.get22BoldTextStyle(color: titleColor ?? AppColor.silverColor),
            textAlign: TextAlign.center,
          ),
          AppSizes.heightBox(boxHeight: 5),
          TextView(
            "Please check your connection and try again.",
            style: AppTextStyles.get16RegularTextStyle(color: subTitleColor ?? Colors.grey),
            textAlign: TextAlign.center,
          ),
          AppSizes.heightBox(boxHeight: 30),
          if(onRetry != null)
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 22),
            label: Text("Retry", style: AppTextStyles.get16MediumTextStyle()),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30.spW, vertical: 12.spH),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
