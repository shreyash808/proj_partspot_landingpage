import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class ResendOtpTimerWidget extends StatelessWidget {
  final VoidCallback onResendTap;
  final int Function() timeBuilder;

  const ResendOtpTimerWidget({
    super.key,
    required this.onResendTap,
    required this.timeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(() {
            final timeLeft = timeBuilder();
            return timeLeft > 0
                ? RichText(
                  text: TextSpan(
                    style: AppTextStyles.get10MediumTextStyle(
                      color: AppColor.colorBEBEBE,
                    ),
                    children: [
                      const TextSpan(text: StringConsts.resendOtpIn),
                      TextSpan(
                        text: " $timeLeft secs",
                        style: AppTextStyles.get10MediumTextStyle(
                          color: AppColor.timerGreen,
                        ),
                      ),
                    ],
                  ),
                )
                : GestureDetector(
                  onTap: onResendTap,
                  child: Text(
                    StringConsts.resendOtp,
                    style: AppTextStyles.get10MediumTextStyle(
                      color: AppColor.timerGreen,
                    ),
                  ),
                );
          }),
        ],
      ),
    );
  }
}
