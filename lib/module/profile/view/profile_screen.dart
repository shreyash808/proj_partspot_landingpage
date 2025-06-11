import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/text_fields/custom_text_field.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<String> selectedCountry = ValueNotifier<String>("🇮🇳");
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  final TextEditingController whatsappNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.deepOrange],
                begin: Alignment.center,
                end: Alignment.bottomLeft,
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
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 60,
                    left: 20,
                    right: 20,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 18),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                            Spacer(),
                            Text(
                              StringConsts.fillDetails,
                              style: AppTextStyles.get24SemiBoldTextStyle(),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          StringConsts.enterName,
                          style: AppTextStyles.get14MediumTextStyle(
                            color: AppColor.textGrey,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: CustomTextField(
                          isSmall: true,

                          controller: nameController,
                          keyboardType: TextInputType.name,
                          hintText: "",
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          StringConsts.enterEmail,
                          style: AppTextStyles.get14MediumTextStyle(
                            color: AppColor.textGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: CustomTextField(
                          isSmall: true,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "",
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          StringConsts.enterWhatsappNo,
                          style: AppTextStyles.get14MediumTextStyle(
                            color: AppColor.textGrey,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          ValueListenableBuilder<String>(
                            valueListenable: selectedCountry,
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      selectedCountry.value = country.flagEmoji;
                                    },
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColor.colorEDEDED,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: AppColor.blackColor,
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
                              isSmall: true,
                              controller: whatsappNumController,
                              keyboardType: TextInputType.phone,
                              hintText: "",
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: isChecked,
                          builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: value,
                                  activeColor: AppColor.buttonOrange,
                                  onChanged: (bool? newValue) {
                                    isChecked.value = newValue ?? false;
                                  },
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.blackColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Agree ',
                                        style:
                                            AppTextStyles.get12MediumTextStyle(
                                              color: AppColor.textGrey,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'T&C',
                                        style: const TextStyle(
                                          color: AppColor.blueAccent,
                                          fontSize: 12,
                                          fontFamily: 'Medium',
                                          decoration: TextDecoration.underline,
                                        ),

                                        recognizer:
                                            TapGestureRecognizer()
                                              ..onTap = () {
                                                print("T&C clicked");
                                              },
                                      ),
                                      TextSpan(
                                        text: ' and continue',
                                        style:
                                            AppTextStyles.get12MediumTextStyle(
                                              color: AppColor.textGrey,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      AppButton(
                        StringConsts.submit,
                        onPressed: () {},
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        textStyle: AppTextStyles.get14BoldTextStyle(
                          color: AppColor.whiteColor,
                        ),
                        // backgroundColor: themeColor,
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
