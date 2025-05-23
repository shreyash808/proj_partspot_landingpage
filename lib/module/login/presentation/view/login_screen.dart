import 'package:flutter/material.dart';

import 'package:partyspot/module/login/presentation/view/widgets/login_header.dart';
import 'package:partyspot/module/login/presentation/view/widgets/phone_input_textfield.dart';
import 'package:partyspot/module/login/presentation/view/widgets/social_login_section.dart';

import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final ValueNotifier<String> selectedCountry = ValueNotifier<String>("🇮🇳");

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.patriarchColor, AppColor.orangeColor],
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
                    bottom: 60,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoginOtpImageHeader(
                        imagePath: AppImages.loginImage,
                        text: StringConsts.Login,
                      ),

                      PhoneInputField(
                        controller: numberController,
                        countryFlagNotifier: selectedCountry,
                      ),

                      SocialLoginSection(),
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
