import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class ResendOtpTimerWidget extends StatelessWidget {
  final ValueNotifier<int> timerNotifier;
  final VoidCallback onResendTap;

  const ResendOtpTimerWidget({
    super.key,
    required this.timerNotifier,
    required this.onResendTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: timerNotifier,
            builder: (context, timeLeft, _) {
              return timeLeft > 0
                  ? RichText(
                    text: TextSpan(
                      style: AppTextStyles.get10MediumTextStyle(
                        color: const Color(0xffBEBEBE),
                      ),
                      children: [
                        const TextSpan(text: StringConsts.resendOtpIn),
                        TextSpan(
                          text: "$timeLeft secs",
                          style: AppTextStyles.get10MediumTextStyle(
                            color: const Color(0xff05A65B),
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
                        color: const Color(0xff05A65B),
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
