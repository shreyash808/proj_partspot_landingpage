import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

import '../classes/app_text_styles.dart';

class DynamicStyledText extends StatelessWidget {
  final String text;
  final Locale locale;

  const DynamicStyledText({
    super.key,
    required this.text,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');

    return Text.rich(
      locale: locale,
      TextSpan(
        locale: locale,
        children:
            words.map((word) {
              final isSpecialWord = word.startsWith('@');
              return TextSpan(
                text: '$word ',
                locale: locale,
                style: AppTextStyles.get14MediumTextStyle(
                  color:
                      isSpecialWord
                          ? AppColor.primaryColor
                          : AppColor.blackColor,
                ),
              );
            }).toList(),
      ),
      textAlign: TextAlign.start,
    );
  }
}
