import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:partyspot/module/login/presentation/view/widgets/login_header.dart';
import 'package:partyspot/module/login_otp/view/widgets/resend_otp_timer.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

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
                      LoginOtpImageHeader(
                        imagePath: AppImages.otpImage,
                        text: StringConsts.enterOtp,
                      ),

                      OtpTextField(
                        numberOfFields: 4,
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xffEDEDED),
                        fieldWidth: 60,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                      ),

                      ResendOtpTimerWidget(
                        timerNotifier: timerNotifier,
                        onResendTap: startTimer,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: AppButton(
                          StringConsts.submit,
                          backgroundColor: AppColor.buttonOrange,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          onPressed: () {
                            Get.offNamed(Routes.appEntryScreen);
                          },
                        ),
                      ),
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
