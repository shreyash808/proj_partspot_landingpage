import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:partyspot/routes/app_routes.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/png/splash.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Image.asset(
              'assets/images/png/splash_overlay.png',
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/png/app_logo.png', width: 150),

                  Text(
                    "Your One Spot for\nEvery Celebration",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.get20SemiBoldTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.onBoardingScreen);
  }
}
