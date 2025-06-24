import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/app_text_field.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class EnterCustomVenueDialog extends StatelessWidget {
  final String? initialValue;

  EnterCustomVenueDialog({super.key, this.initialValue});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? '';

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Dialog Title
            Text(
              StringConsts.enterVenue,
              style: AppTextStyles.get18SemiBoldTextStyle(color: AppColor.blackColor),
            ),
            const SizedBox(height: 16),

            /// Form Field
            Form(
              key: formKey,
              child: AppTextField(
                controller: controller,
                hint: StringConsts.venueType,
                initialControllerValue: initialValue,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return StringConsts.invalidInput;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: AppOutlinedButton(
                    StringConsts.cancel,
                    onPressed: () => Navigator.of(context).pop(null),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppButton(
                    StringConsts.done,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        final intValue = int.tryParse(controller.text.trim());
                        Navigator.of(context).pop(intValue);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
