import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/buttons/custom_button.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/text_fields/custom_text_field.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final ValueNotifier<String> counter = ValueNotifier<String>("🇮🇳");

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
                      CustomImageAsset(
                        image: AppImages.loginImage,
                        height: 200,
                      ),
                      // Image.asset(
                      //  AppImages.loginImage,
                      //   height: 200,
                      // ),
                      const SizedBox(height: 10),
                      Text(
                        StringConsts.Login,
                        style: AppTextStyles.get24SemiBoldTextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ValueListenableBuilder<String>(
                            valueListenable: counter,
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      counter.value = country.flagEmoji;
                                    },
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDEDED),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: numberController,
                              keyboardType: TextInputType.number,
                              hintText: StringConsts.enterPhNum,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      AppButton(
                        StringConsts.next,
                        backgroundColor: AppColor.buttonOrange,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        onPressed: () {
                          Get.offNamed(Routes.otpScreen);
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(color: Color(0xFFD9D9D9)),
                      ),
                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFD9D9D9),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.apple, size: 30),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  StringConsts.conWithApple,
                                  style: AppTextStyles.get14MediumTextStyle(
                                    color: Color(0xff727272),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFD9D9D9),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.apple, size: 30),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  StringConsts.conWithGoogle,
                                  style: AppTextStyles.get14MediumTextStyle(
                                    color: Color(0xff727272),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
