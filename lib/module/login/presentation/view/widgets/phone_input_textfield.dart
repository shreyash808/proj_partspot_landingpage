import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/text_fields/custom_text_field.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<String> countryFlagNotifier;
  final Function(String? val) onChangeCountryCode;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.countryFlagNotifier,
    required this.onChangeCountryCode,
  });

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
                          countryFlagNotifier.value = country.countryCode;
                        },
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
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
                  controller: controller,
                  keyboardType: TextInputType.number,
                  hintText: StringConsts.enterPhNum,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
