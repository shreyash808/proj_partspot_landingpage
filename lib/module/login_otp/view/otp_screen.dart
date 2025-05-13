import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/buttons/custom_button.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final ValueNotifier<int> timerNotifier = ValueNotifier<int>(20);
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    timerNotifier.value = 20;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerNotifier.value <= 0) {
        timer.cancel();
      } else {
        timerNotifier.value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF70057A), Color(0xFFFF4B20)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 80,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageAsset(image: AppImages.otpImage, height: 200),
                      // Image.asset(
                      //   AppImages.otpImage,
                      //   height: 200,
                      // ),
                      const SizedBox(height: 10),
                      Text(
                        StringConsts.enterOtp,
                        style: AppTextStyles.get24SemiBoldTextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      OtpTextField(
                        numberOfFields: 4,
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xffEDEDED),
                        fieldWidth: 60,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ValueListenableBuilder<int>(
                            valueListenable: timerNotifier,
                            builder: (context, timeLeft, _) {
                              return timeLeft > 0
                                  ? RichText(
                                    text: TextSpan(
                                      style: AppTextStyles.get10MediumTextStyle(
                                        color: Color(0xffBEBEBE),
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: StringConsts.resendOtpIn,
                                        ),
                                        TextSpan(
                                          text: "$timeLeft secs",
                                          style:
                                              AppTextStyles.get10MediumTextStyle(
                                                color: Color(0xff05A65B),
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : GestureDetector(
                                    onTap: () {
                                      startTimer();
                                    },
                                    child: Text(
                                      StringConsts.resendOtp,
                                      style: AppTextStyles.get10MediumTextStyle(
                                        color: Color(0xff05A65B),
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      AppButton(
                        StringConsts.submit,
                        backgroundColor: AppColor.buttonOrange,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        onPressed: () {
                          Get.offNamed(Routes.homeScreen);
                        },
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
