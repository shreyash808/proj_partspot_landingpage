import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/app_text_field.dart';

class EnterGuestDialog extends StatelessWidget {
  final String? initialValue;
  EnterGuestDialog({super.key,required this.initialValue});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(24),
      content: Form(
        key: formKey,
        child: AppTextField(
          controller: controller,
          inputType: TextInputType.number,
          hint: StringConsts.noOfGuests,
          initialControllerValue: initialValue,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return StringConsts.invalidInput;
            }
            if (int.tryParse(value.trim()) == null) {
              return StringConsts.invalidInput;
            }
            if ((int.tryParse(value.trim()) ?? 0) <= 0 ) {
              return StringConsts.invalidInput;
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: Text(StringConsts.cancel,style: AppTextStyles.get16RegularTextStyle(color: AppColor.blackColor),),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              final intValue = int.tryParse(controller.text.trim());
              Navigator.of(context).pop(intValue);
            }
          },
          child: Text(StringConsts.done,style: AppTextStyles.get16RegularTextStyle(color: AppColor.primaryColor),),
        ),
      ],
    );
  }
}
