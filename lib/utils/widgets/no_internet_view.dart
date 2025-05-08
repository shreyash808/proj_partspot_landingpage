import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class NoInternetView extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetView({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 100,
            ),
            // const SizedBox(height: 24),
            // Text(
            //   StringConsts.noInternetConnection,
            //   style: AppTextStyles.get24BoldTextStyle(),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(height: 12),
            // Text(
            //   StringConsts.pleaseCheckYourInternetAgain,
            //   style: AppTextStyles.get16RegularTextStyle(),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(height: 32),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: AppButton(
            //       StringConsts.retry,
            //       onPressed:onRetry),
            // ),
          ],
        ),
      ),
    );
  }
}
