import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partyspot/utils/buttons/custom_button.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final ValueNotifier<int> timerNotifier = ValueNotifier<int>(20);
  Timer? _timer;

  void startTimer() {
    // Cancel any existing timer before starting a new one
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
    // Start the timer after widget build
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
                      Image.asset(
                        'assets/images/png/otp_image.png',
                        height: 200,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Enter OTP",
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
                                        const TextSpan(text: "Resend OTP in "),
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
                                      "Resend OTP",
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
                      CustomButton(onTap: () {}, text: "Submit"),
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
