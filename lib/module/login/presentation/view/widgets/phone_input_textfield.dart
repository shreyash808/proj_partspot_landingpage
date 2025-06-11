import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/text_fields/custom_text_field.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<String> countryFlagNotifier;

  const PhoneInputField({
    Key? key,
    required this.controller,
    required this.countryFlagNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: [
              ValueListenableBuilder<String>(
                valueListenable: countryFlagNotifier,
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          countryFlagNotifier.value = country.flagEmoji;
                        },
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColor.colorEDEDED,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
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
                  controller: controller,
                  keyboardType: TextInputType.number,
                  hintText: StringConsts.enterPhNum,
                ),
              ),
            ],
          ),
        ),

        AppButton(
          StringConsts.next,
          backgroundColor: AppColor.buttonOrange,
          margin: const EdgeInsets.symmetric(vertical: 8),
          onPressed: () {
            Get.offNamed(Routes.otpScreen);
          },
        ),
      ],
    );
  }
}
